class SearchFlight::Vna::FareFormula::Infant
  attr_reader :fare_formula
  def initialize
    @fare_formula = Flight::FareFormula.new(10, 10, 0)
  end
end
