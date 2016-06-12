class Http::HttpFactory
  def self.new_http
    Http::HttpService.new
  end
end