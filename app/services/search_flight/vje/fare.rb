class SearchFlight::Vje::Fare
  def initialize(flight_container)
    @flight_container   = flight_container
    fare_formula        = SearchFlight::FareFormulaFactory.get_formula(Airline.CATEGORies[:VIETJET])
    @fare_flights       = SearchFlight::FareFlights.new(flight_container, fare_formula)
  end

  def calculate
    @flight_container = @fare_flights.calculate
  end
end
