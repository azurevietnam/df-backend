class SearchFlight::Jet::Parse
  def initialize(content, params)
    @params           = params
    @html_content     = Nokogiri::HTML(content)
    @parse_unit       = SearchFlight::Jet::ParseUnit.new
    @parse_flight     = SearchFlight::ParseFlight.new(@parse_unit, @html_content)
    @flight_container = Flight::FlightContainer.new
  end

  def parse
    if Order::OrderRoundType.is_round_trip(@params.round_type)
      @flight_container.depart_flights = @parse_flight.flights('div.fare-picker.depart div.fares table.domestic tbody tr:not(.business-options):not(.starter-options)')
      @flight_container.return_flights = @parse_flight.flights('div.fare-picker.return div.fares table.domestic tbody tr:not(.business-options):not(.starter-options)')
    else
      @flight_container.depart_flights = @parse_flight.flights('div.fares table.domestic tbody tr:not(.business-options):not(.starter-options)')
    end
    @flight_container
  end
end
