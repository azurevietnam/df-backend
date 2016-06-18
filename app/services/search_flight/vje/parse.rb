class SearchFlight::Vje::Parse
  def initialize(content, params)
    @params           = params
    @html_content     = Nokogiri::HTML(content)
    @parse_unit       = SearchFlight::Vje::ParseUnit.new
    @parse_flight     = SearchFlight::ParseFlight.new(@parse_unit, @html_content)
    @flight_container = Flight::FlightContainer.new
  end

  def parse
    if Order::OrderRoundType.is_round_trip(@params.round_type)
      @flight_container.depart_flights = @parse_flight.flights('#toDepDiv .FlightsGrid tr[id*=gridTravel]')
      @flight_container.return_flights = @parse_flight.flights('#toRetDiv .FlightsGrid tr[id*=gridTravel]')
    else
      @flight_container.depart_flights = @parse_flight.flights('.FlightsGrid tr[id*=gridTravel]')
    end
    @flight_container
  end
end
