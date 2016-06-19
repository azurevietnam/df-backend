class SearchFlight::FareFormulaGroup
  attr_reader :fare_formula_adult, :fare_formula_child, :fare_formula_infant
  def initialize(fare_formula_adult, fare_formula_child, fare_formula_infant)
    @fare_formula_adult  = fare_formula_adult
    @fare_formula_child  = fare_formula_child
    @fare_formula_infant = fare_formula_infant
  end
end
