class SearchFlight::Vna::FareFormula::Child
  attr_reader :fare_formula
  def initialize
    @fare_formula = Flight::FareFormula.new(75, 10, 40000)
  end
end
