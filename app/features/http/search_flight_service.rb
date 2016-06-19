class Http::SearchFlightService
  include HTTParty
  base_uri 'http://booknow.jetstar.com'
  def self.search(url, options)
    byebug
    post('/Search.aspx?culture=vi-VN', options)
  end
end
