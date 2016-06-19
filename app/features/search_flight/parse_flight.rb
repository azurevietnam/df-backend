class SearchFlight::ParseFlight
  def initialize(parse_unit, html_content)
    @parse_unit   = parse_unit
    @html_content = html_content
  end

  def flights(selector)
    flights = []
    flights_table = @html_content.css(selector)
    flights_table.each do |flight_row|
      if @parse_unit.flight_direct?(flight_row)
        flight              = Flight::Flight.new()
        flight.airline_type = @parse_unit.airline_type()
        flight.flight_code  = @parse_unit.flight_code(flight_row)
        flight.from_time    = @parse_unit.from_time(flight_row)
        flight.to_time      = @parse_unit.to_time(flight_row)
        flight.price_web    = @parse_unit.price_web(flight_row)
        if !flight.price_web.nil?
          flights << flight
        end
      end
    end
    flights
  end
end
