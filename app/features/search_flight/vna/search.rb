class SearchFlight::Vna::Search
  def initialize(search_params)
    uri            = 'https://wl-prod.sabresonicweb.com'
    @search_params = search_params
    http_service   = Http::HttpFactory.new_http
    option_builder = SearchFlight::Vna::OptionBuilder.new(uri, search_params)
    @request       = SearchFlight::Vna::Request.new(option_builder, http_service)
  end

  def call
    html_content     = get_html_content()
    flight_container = parse_content(html_content, @search_params)
    flight_container = calculate_fare(flight_container)
  end

  private
    def get_html_content
      response = @request.call
      response.data
    end
    def parse_content(html_content, search_params)
      parser           = SearchFlight::Vna::Parse.new(html_content, search_params)
      flight_container = parser.parse()
      flight_container
    end
    def calculate_fare(flight_container)
      fare             = SearchFlight::Vna::Fare.new(flight_container)
      flight_container = fare.calculate()
      flight_container
    end
end
