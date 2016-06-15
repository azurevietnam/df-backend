class SearchFlight::Vje::SearchFlightRequest
  def initialize(builder, http_service)
    @builder = builder
    @http_service = http_service
  end

  def call
    response = @http_service.post(@builder.url, @builder.options_first)
    response = @http_service.post(@builder.url, @builder.options_second(response.data))
    response
  end
end
