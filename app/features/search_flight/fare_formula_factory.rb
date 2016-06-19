class SearchFlight::FareFormulaFactory
  def self.get_formula(airline_type)
    case airline_type
    when Airline.CATEGORies[:VNAIRLINE]
      fare_formula_adult  = SearchFlight::Vna::FareFormula::Adult.new
      fare_formula_child  = SearchFlight::Vna::FareFormula::Child.new
      fare_formula_infant = SearchFlight::Vna::FareFormula::Infant.new
    when Airline.CATEGORies[:JETSTAR]
      fare_formula_adult  = SearchFlight::Jet::FareFormula::Adult.new
      fare_formula_child  = SearchFlight::Jet::FareFormula::Child.new
      fare_formula_infant = SearchFlight::Jet::FareFormula::Infant.new
    when Airline.CATEGORies[:VIETJET]
      fare_formula_adult  = SearchFlight::Vje::FareFormula::Adult.new
      fare_formula_child  = SearchFlight::Vje::FareFormula::Child.new
      fare_formula_infant = SearchFlight::Vje::FareFormula::Infant.new
    else
      raise AirlineTypeException.new
    end
    fare_formula = SearchFlight::FareFormulaGroup.new(fare_formula_adult, fare_formula_child, fare_formula_infant)
  end
end
