class SearchFlight::Jet::Request
  def initialize(builder, http_service)
    @builder = builder
    @http_service = http_service
  end

  def call
    response = @http_service.post(@builder.url, @builder.options)
    response
  end
end
