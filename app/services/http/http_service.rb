class Http::HttpService
  def post(url, options)
    HTTParty.post(url, options)
  end
  def get(url, options)
    HTTParty.get(url, options)
  end
  # include HTTParty
end
