class SearchFlight::Jet::ParseUnit < SearchFlight::ParseUnit
  def flight_code(flight_row)
    extract_flight_code(flight_row.at_css('span.flight-no').text)
  end

  def from_time(flight_row)
    extract_time(flight_row.at_css('td:nth-child(1) strong').text)
  end

  def to_time(flight_row)
    extract_time(flight_row.at_css('td:nth-child(2) strong').text)
  end

  def price_web(flight_row)
    cheapest_price(flight_row)
  end

  def flight_direct?(flight_row)
    return !flight_row.at_css('.stops').nil? && flight_row.at_css('.stops').text == "Bay thẳng"
  end

  def airline_type
    Airline.CATEGORies[:JETSTAR]
  end

  private
    def extract_flight_code(flight_code)
      flight_code.gsub(/\s+/, '')
    end
    def extract_time(time)
      time.match(/\d{1,2}:\d{1,2}/)[0]
    end
    def cheapest_price(flight_row)
      price = nil
      price_str =  price_starter(flight_row)
      if price_str.nil?
        price_str =  price_business(flight_row)
      end
      if !price_str.nil? && !price_str.empty?
        price = price_str.to_i
      end
      price
    end
    def price_starter(flight_row)
      price_result = nil

      price = flight_row.css('td:nth-child(4) label')
      if !price.nil?
        price_result = price.text.gsub(/[^\d]/, '')
      end
      price_result
    end
    def price_business(flight_row)
      price_result = nil

      price = flight_row.css('td:nth-child(5) label')
      if !price.nil?
        price_result = price.text.gsub(/[^\d]/, '')
      end
      price_result
    end
end
