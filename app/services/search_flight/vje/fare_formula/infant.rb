class SearchFlight::Vje::FareFormula::Infant
  attr_reader :fare_formula
  def initialize
    @fare_formula = Flight::FareFormula.new(0, 10, 0)
  end
end
