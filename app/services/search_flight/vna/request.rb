class SearchFlight::Vna::Request
  def initialize(builder, http_service)
    @builder = builder
    @http_service = http_service
  end

  def call
    response = @http_service.get(@builder.url, {})
    response
  end
end
