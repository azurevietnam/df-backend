class Http::SearchFlightService
  include HTTParty
  ssl_version :SSLv3
  def self.search(url, options)
    post(url, options)
  end
end
