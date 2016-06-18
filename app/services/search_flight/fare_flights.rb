class SearchFlight::FareFlights
  def initialize(flight_container, fare_formula)
    @flight_container = flight_container
    @fare_flight = SearchFlight::FareFlight.new(fare_formula)
  end

  def call
    if @flight_container.depart_flights.count > 0
      calculate(@flight_container.depart_flights)
    end
    if !@flight_container.return_flights.nil? && @flight_container.return_flights.count > 0
      calculate(@flight_container.return_flights)
    end
    @flight_container
  end

  def calculate(flights)
    flights.each do |flight|
      @fare_flight.call(flight)
    end
  end
end
