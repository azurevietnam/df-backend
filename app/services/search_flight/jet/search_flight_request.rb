class SearchFlight::Jet::SearchFlightRequest
  def initialize(builder, http_service)
    @builder = builder
    @http_service = http_service
  end

  def call
    options = {
      body: @builder.body,
      headers: {
              "Accept-Encoding" => "gzip, deflate",
              "Content-type" => "application/x-www-form-urlencoded"
              }
    }
    response = @http_service.post(@builder.url, options)
    response
  end
end
