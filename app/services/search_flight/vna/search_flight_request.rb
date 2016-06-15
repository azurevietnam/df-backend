class SearchFlight::Vna::SearchFlightRequest
  def initialize(builder, http_service)
    @builder = builder
    @http_service = http_service
  end
  
  def call
    options = {}
    response = @http_service.get(@builder.get_first_url, options)
    response
  end
end