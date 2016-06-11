class OrdersController < ApplicationController
  def create
    contact_info = Order::ContactInfo.new(create_params[:contact_phone], create_params[:contact_email], 
                                            create_params[:contact_name], create_params[:contact_gender])
    get_customer_order = Order::GetCustomerOrder.new
    order_no_generator = Order::OrderNoGenerator.new
    
    create_order = Order::CreateOrder.new(create_params, get_customer_order, contact_info, order_no_generator)
    response = create_order.call
    
    if response.success?
      render json: response.data, status: :created
    else
      render json: {errors: response.message}, status: :unprocessable_entity
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
  
  private
    def create_params
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
end
