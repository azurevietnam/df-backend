class OrdersController < ApplicationController
  def create
    contact_info = Order::ContactInfo.new(create_params[:contact_phone], create_params[:contact_email], 
                                            create_params[:contact_name], create_params[:contact_gender])
    get_customer_order = Order::GetCustomerOrder.new
    order_no_generator = Order::OrderNoGenerator.new
    calculate_price_order = Order::CalculatePriceOrder.new({round_type: create_params[:round_type].to_i, depart_total: create_params[:depart_total].to_i, return_total: create_params[:return_total].to_i})
    create_order = Order::CreateOrder.new(create_params, get_customer_order, contact_info, order_no_generator, calculate_price_order)
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
  
  def update
    contact_info = Order::ContactInfo.new(update_params[:contact_phone], update_params[:contact_email], 
                                            update_params[:contact_name], update_params[:contact_gender])
    get_customer_order = Order::GetCustomerOrder.new
    calculate_price_order = Order::CalculatePriceOrder.new({round_type: update_params[:round_type].to_i, depart_total: update_params[:depart_total].to_i, return_total: update_params[:return_total].to_i})
    update_order = Order::UpdateOrder.new(update_params, get_customer_order, contact_info, calculate_price_order)
    response = update_order.call
    if response.success?
      render json: response.data, status: :ok
    else
      render json: {errors: response.message}, status: :unprocessable_entity
    end
  end
  
  def find
    order = Order.includes(:passengers).where("order_number=? or depart_book_code=? or return_book_code=?", params[:order_number], params[:book_code], params[:book_code]).first!
    render json: order.to_json(include: :passengers), status: :ok
  end
  
  private
    def create_params
      params.require(:order).permit(:contact_name, :contact_phone, :contact_email, :contact_gender, 
        :ori_place_id, :des_place_id, :round_type, :adult, :child, :infant,
        :depart_airline_id, :depart_flight_code, :depart_date, :depart_from_time, :depart_to_time, :depart_book_code,
        :depart_web_price_net, :depart_total,
        :return_airline_id, :return_flight_code, :return_date, :return_from_time, :return_to_time, :return_book_code,
        :return_web_price_net, :return_total,
        :contact_note, :admin_note, 
        :customer_id,
        :passengers_attributes => [:no, :name, :gender, :category]
        )
    end
    def update_params
      params.require(:order).permit(:order_id, :contact_name, :contact_phone, :contact_email, :contact_gender, 
        :ori_place_id, :des_place_id,
        :depart_airline_id, :depart_flight_code, :depart_date, :depart_from_time, :depart_to_time, :depart_book_code,
        :depart_web_price_net, :depart_total,
        :return_airline_id, :return_flight_code, :return_date, :return_from_time, :return_to_time, :return_book_code,
        :return_web_price_net, :return_total,
        :contact_note, :admin_note, 
        :customer_id,
        :passengers_attributes => [:id, :no, :name, :gender, :category]
        )
    end
end
