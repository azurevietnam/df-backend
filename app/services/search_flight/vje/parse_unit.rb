class SearchFlight::Vje::ParseUnit < SearchFlight::ParseUnit
  def flight_code(flight_row)
    flight_row.at_css('.airlineVJ').text
  end

  def from_time(flight_row)
    extract_time(flight_row.at_css('.SegInfo:nth-child(2)').text)
  end

  def to_time(flight_row)
    extract_time(flight_row.at_css('.SegInfo:nth-child(3)').text)
  end

  def price_web(flight_row)
    cheapest_price(flight_row)
  end

  def flight_direct?(flight_row)
    true
  end

  private
    def cheapest_price(flight_row)
      price_result = nil
      prices = flight_row.css('.FaresGrid td')
      prices.each do |price|
        if !price.text.gsub(/[^\d]/, '').empty?
          price_result = price.text.gsub(/[^\d]/, '')
          break
        end
      end
      price_result
    end
    def extract_time(time_str)
      time_str.match(/\d{1,2}:\d{1,2}/)[0]
    end
end
