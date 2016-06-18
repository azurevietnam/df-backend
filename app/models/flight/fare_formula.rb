class Flight::FareFormula
  attr_accessor :percent_price_web, :percent_vat, :service_fee
  def initialize(percent_price_web, percent_vat, service_fee)
    @percent_price_web = percent_price_web
    @percent_vat       = percent_vat
    @service_fee       = service_fee
  end
end
