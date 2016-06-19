class SearchFlight::Vna::Parse
  def initialize(content, params)
    @params           = params
    @html_content     = Nokogiri::HTML(content)
    @parse_unit       = SearchFlight::Vna::ParseUnit.new
    @parse_flight     = SearchFlight::ParseFlight.new(@parse_unit, @html_content)
    @flight_container = Flight::FlightContainer.new
  end

  def parse
    if Order::OrderRoundType.is_round_trip(@params.round_type)
      @flight_container.depart_flights = @parse_flight.flights('#dtcontainer-outbounds tbody tr')
      @flight_container.return_flights = @parse_flight.flights('#dtcontainer-inbounds tbody tr')
    else
      @flight_container.depart_flights = @parse_flight.flights('#dtcontainer-both tbody tr')
    end
    @flight_container
  end
end
