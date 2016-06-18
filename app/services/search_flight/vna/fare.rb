class SearchFlight::Vna::Fare
  def initialize(flight_container)
    @flight_container   = flight_container
    fare_formula        = SearchFlight::FareFormulaFactory.get_formula(Airline.CATEGORies[:VNAIRLINE])
    @fare_flights       = SearchFlight::FareFlights.new(flight_container, fare_formula)
  end

  def calculate
    @flight_container = @fare_flights.call
  end
end
