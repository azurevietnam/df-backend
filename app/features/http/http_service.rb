class Http::HttpService
  def post(url, options)
    response = nil
    begin
      response = HTTParty.post(url, options)
      response = Response::Success.new(data: response)
    rescue HTTParty::Error => ex
      response = Response::Error.new(error_type: ex, message: ex.message)
    end
    response
  end
  def get(url, options)
    response = nil
    begin
      response = HTTParty.get(url, options)
      response = Response::Success.new(data: response)
    rescue HTTParty::Error => ex
      response = Response::Error.new(error_type: ex, message: ex.message)
    end
    response
  end
end
