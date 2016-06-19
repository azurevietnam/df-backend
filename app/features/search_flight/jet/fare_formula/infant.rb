class SearchFlight::Jet::FareFormula::Infant
  attr_reader :fare_formula
  def initialize
    @fare_formula = Flight::FareFormula.new(0, 10, 150000)
  end
end
