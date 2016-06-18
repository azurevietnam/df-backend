class SearchFlight::FareFlight
  def initialize(fare_formula)
    @fare_formula  = fare_formula
  end

  def call(flight)
    flight.price_adult  = calculate(flight.price_web, @fare_formula.fare_formula_adult.fare_formula)
    flight.price_child  = calculate(flight.price_web, @fare_formula.fare_formula_child.fare_formula)
    flight.price_infant = calculate(flight.price_web, @fare_formula.fare_formula_infant.fare_formula)
  end

  private
    def calculate(price_web, fare_formula)
      price = price_web * fare_formula.percent_price_web / 100
      price = price + price * fare_formula.percent_vat/100 + fare_formula.service_fee
      price
    end
end
