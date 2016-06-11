class Order::CreateOrder
  def initialize(create_params, get_customer_order, contact_info, order_no_generator)
    @create_params = create_params
    @get_customer_order = get_customer_order
    @contact_info = contact_info
    @order_no_generator = order_no_generator
  end
  
  def call
    begin
      order = Order.new(@create_params)
      order.order_number = @order_no_generator.call
      order.customer = @get_customer_order.call(@create_params[:customer_id], @contact_info)
      order.ori_place = Place.find(@create_params[:ori_place_id])
      order.des_place = Place.find(@create_params[:des_place_id])
      order.ori_code = order.ori_place.code
      order.ori_name = order.ori_place.name
      order.ori_name_unsigned = order.ori_place.name_unsigned
      order.ori_short_name = order.ori_place.short_name
      order.des_code = order.des_place.code
      order.des_name = order.des_place.name
      order.des_name_unsigned = order.des_place.name_unsigned
      order.des_short_name = order.des_place.short_name
      order.depart_airline = Airline.find(@create_params[:depart_airline_id])
      order.depart_airline_name = order.depart_airline.name
      order.depart_airline_short_name = order.depart_airline.short_name
      order.depart_airline_type = order.depart_airline.category
      if Order::OrderRoundType.is_round_trip(order.round_type)
        order.return_airline = Airline.find(@create_params[:return_airline_id])
        order.return_airline_name = order.return_airline.name
        order.return_airline_short_name = order.return_airline.short_name
        order.return_airline_type = order.return_airline.category
      end
      if order.save
        @response = Response::Success.new(order, "")
      else
        @response = Response::Error.new(nil, order.errors)
      end
    rescue
      @response = Response::Error.new(nil, "some parameters are missed")
    end
  end
end