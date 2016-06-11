class EmailOrderFormatter
  def self.show_luggage(luggage_weight)
    luggage_str = "7kg xách tay"
    if luggage_weight > 0
      luggage_str << " + #{luggage_weight}kg ký gửi"
    end
    return luggage_str
  end
end