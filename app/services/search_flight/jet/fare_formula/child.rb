class SearchFlight::Jet::FareFormula::Child
  attr_reader :fare_formula
  def initialize
    @fare_formula = Flight::FareFormula.new(100, 10, 150000)
  end
end
