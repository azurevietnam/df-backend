class Order::UpdateOrder
  def initialize(update_params, get_customer_order, contact_info, calculate_price_order)
    @update_params = update_params
    @get_customer_order = get_customer_order
    @contact_info = contact_info
    @calculate_price_order = calculate_price_order
  end
  
  def call
    begin
      order = Order.includes(:passengers).find_by!(id: @update_params[:order_id])
      @update_params = filter_params(@update_params)
      order.assign_attributes(@update_params)
      order.customer = @get_customer_order.call(@update_params[:customer_id], @contact_info)
      order.ori_place = Place.find(@update_params[:ori_place_id])
      order.des_place = Place.find(@update_params[:des_place_id])
      order.ori_code = order.ori_place.code
      order.ori_name = order.ori_place.name
      order.ori_name_unsigned = order.ori_place.name_unsigned
      order.ori_short_name = order.ori_place.short_name
      order.des_code = order.des_place.code
      order.des_name = order.des_place.name
      order.des_name_unsigned = order.des_place.name_unsigned
      order.des_short_name = order.des_place.short_name
      order.depart_airline = Airline.find(@update_params[:depart_airline_id])
      order.depart_airline_name = order.depart_airline.name
      order.depart_airline_short_name = order.depart_airline.short_name
      order.depart_airline_type = order.depart_airline.category
      if Order::OrderRoundType.is_round_trip(order.round_type)
        order.return_airline = Airline.find(@update_params[:return_airline_id])
        order.return_airline_name = order.return_airline.name
        order.return_airline_short_name = order.return_airline.short_name
        order.return_airline_type = order.return_airline.category
      end
      order.total_price = @calculate_price_order.call
      if order.save
        @response = Response::Success.new(data: order)
      else
        @response = Response::Error.new(message: order.errors)
      end
    rescue ActiveRecord::RecordNotFound => ex
      @response = Response::Error.new(error_type: ex, message: ex.message)
    end
    @response
  end
  
  private
    def filter_params(params)
      [:order_id, :order_number, :round_type, :adult, :child, :infant, :status, :created_at, :total_price].each { |k| params.delete(k) }
      params
    end
end