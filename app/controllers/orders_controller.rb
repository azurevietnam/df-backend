class OrdersController < ApplicationController
  def create
    begin
      order = Order.new(order_creation_params)
      order.order_number = generate_order_number
      order.customer = get_or_create_customer(order_creation_params[:customer_id], order_creation_params[:contact_phone], 
                                            order_creation_params[:contact_email], order_creation_params[:contact_name], 
                                            order_creation_params[:contact_gender])
      
      order.ori_place = Place.find(order_creation_params[:ori_place_id])
      order.des_place = Place.find(order_creation_params[:des_place_id])
      order.ori_code = order.ori_place.code
      order.ori_name = order.ori_place.name
      order.ori_name_unsigned = order.ori_place.name_unsigned
      order.ori_short_name = order.ori_place.short_name
      order.des_code = order.des_place.code
      order.des_name = order.des_place.name
      order.des_name_unsigned = order.des_place.name_unsigned
      order.des_short_name = order.des_place.short_name
      
      order.depart_airline = Airline.find(order_creation_params[:depart_airline_id])
      order.depart_airline_name = order.depart_airline.name
      order.depart_airline_short_name = order.depart_airline.short_name
      order.depart_airline_type = order.depart_airline.category
      if is_round_trip(order.round_type)
        order.return_airline = Airline.find(order_creation_params[:return_airline_id])
        order.return_airline_name = order.return_airline.name
        order.return_airline_short_name = order.return_airline.short_name
        order.return_airline_type = order.return_airline.category
      end

      if order.save
        render json: order, status: :created
      else
        render json: {errors: order.errors}, status: :unprocessable_entity
      end
    rescue
      render json: {errors: 'some parameters are missed'}, status: :unprocessable_entity
    end
  end
  
  def show
    order = Order.includes(:passengers).find(params[:id])
    render json: order.to_json(include: :passengers), status: :ok
  end
  
  def find
    order = Order.includes(:passengers).find_by!(order_number: params[:order_number])
    render json: order.to_json(include: :passengers), status: :ok
  end
  
  def generate_order_number
    order_no = nil
    loop do
      order_no = SecureRandom.hex(16/4).upcase
      break unless Order.exists?(:order_number => order_no)
    end
    return order_no
  end

  private
    def order_creation_params
      params.require(:order).permit(:contact_name, :contact_phone, :contact_email, :contact_gender, 
        :ori_place_id, :des_place_id, :round_type,
        :depart_airline_id, :depart_flight_code, :depart_date, :depart_from_time, :depart_to_time, :depart_book_code,
        :depart_web_price_net, :depart_total,
        :return_airline_id, :return_flight_code, :return_date, :return_from_time, :return_to_time, :return_book_code,
        :return_web_price_net, :return_total,
        :total_price,
        :contact_note, :admin_note, 
        :customer_id,
        :passengers_attributes => [:no, :name, :gender, :category]
        )
    end
    def get_or_create_customer(customer_id, phone, email, name, gender)
      if !customer_id.nil?
        customer = Customer.find(customer_id)
      end
      if customer.nil?
        customer = Customer.where(phone: phone).first_or_initialize do |c|
          c.name = name
          c.email = email
          c.gender = gender;
        end
      end
      return customer
    end
    def is_round_trip(round_type)
      return round_type == 2
    end
end
