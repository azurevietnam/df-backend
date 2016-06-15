class SearchFlight::Jet::SearchFlightRequest
  def initialize(builder, http_service)
    @builder = builder
    @http_service = http_service
  end

  def call
    response = HTTParty.post(@builder.url,
      body: @builder.body,
      headers: {
              "Accept-Encoding" => "gzip, deflate",
              "Content-type" => "application/x-www-form-urlencoded"
              }
    )
    response
  end
end
