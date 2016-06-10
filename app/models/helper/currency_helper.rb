class Helper::CurrencyHelper
  def self.format(currency, *unit)
    if !unit.empty?
      currency_str = ActiveSupport::NumberHelper.number_to_currency(currency, unit: unit[0].to_s, separator: ".", delimiter: ",", precision: 0, format: "%n %u")
    else
      currency_str = ActiveSupport::NumberHelper.number_to_currency(currency, unit: "VND", separator: ".", delimiter: ",", precision: 0, format: "%n %u")
    end
    return currency_str
  end
end