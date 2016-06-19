class Order::CalculatePriceOrder
  
  def initialize(args)
    @round_type = args[:round_type]
    @depart_total = args[:depart_total]
    @return_total = args[:return_total]
  end
  
  def call
    total = @depart_total
    if Order::OrderRoundType.is_round_trip(@round_type)
      total += @return_total
    end
    total
  end
end