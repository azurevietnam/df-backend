class SearchFlight::Vje::SearchFlightRequest
  def initialize(builder, http_service)
    @builder = builder
    @http_service = http_service
  end

  def call
    response = @http_service.post(@builder.url,
      {
        body: @builder.body_first,
        headers: {
                'Host' => 'book.vietjetair.com',
                'Accept-Encoding' => 'gzip, deflate',
                'Content-Type' => 'application/x-www-form-urlencoded'
                }
      }
    )
    response = @http_service.post(@builder.url,
      {
        body: @builder.body_second,
        headers: {
                'Accept-Encoding' => 'gzip, deflate',
                'Cookie' => response.headers["set-cookie"],
                'Content-Type' => 'application/x-www-form-urlencoded'
                }
      }
    )
    # byebug
    response
  end
end
