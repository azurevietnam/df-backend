class SearchFlight::Vje::FareFormula::Adult
  attr_reader :fare_formula
  def initialize
    @fare_formula = Flight::FareFormula.new(100, 10, 190000)
  end
end
