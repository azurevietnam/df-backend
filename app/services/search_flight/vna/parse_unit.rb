class SearchFlight::Vna::ParseUnit < SearchFlight::ParseUnit
  def flight_code(flight_row)
    flight_row.at_css('.flightDetails-link .flight-number').text
  end

  def from_time(flight_row)
    flight_row.at_css('.departureDate .wasTranslated').text
  end

  def to_time(flight_row)
    flight_row.at_css('.arrivalDate .wasTranslated').text
  end

  def price_web(flight_row)
    cheapest_price(flight_row)
  end

  def flight_direct?(flight_row)
    number_stops = flight_row.at_css('.stops')
    return !number_stops.nil? && number_stops.text.to_i == 0
  end

  def airline_type
    Airline.CATEGORies[:VNAIRLINE]
  end

  private
    def cheapest_price(flight_row)
      price = nil
      prices = flight_row.css('.prices-amount')
      if prices.count > 0
        price_str = prices.last.text.gsub(/[^\d]/, '')
        if !price_str.empty?
          price = price_str.to_i
        end
      end
      price
    end
end
