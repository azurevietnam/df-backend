class SearchFlight::ParseUnit
  def flight_code(flight_row)
    raise NotImplementedError
  end

  def from_time(flight_row)
    raise NotImplementedError
  end

  def to_time(flight_row)
    raise NotImplementedError
  end

  def price_web(flight_row)
    raise NotImplementedError
  end

  def flight_direct?(flight_row)
    raise NotImplementedError
  end

  def flight(flight_row)
    raise NotImplementedError
  end
end
