class Order::OrderRoundType
  def self.is_round_trip(round_type)
    return round_type == Order.ROUND_TYPEs[:ROUND_TRIP]
  end
  
  def self.name(round_type)
    return round_type == Order.ROUND_TYPEs[:ROUND_TRIP] ? "Khứ hồi" : "Một chiều"
  end
end