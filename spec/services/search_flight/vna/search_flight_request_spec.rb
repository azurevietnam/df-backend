require 'rails_helper'

RSpec.describe SearchFlight::Vna::SearchFlightRequest do
  describe 'send search request to Vietnam airline website' do
    context 'send request successfully' do
      ori_code      = 'SGN'
      des_code      = 'HAN'
      round_type    = Order.ROUND_TYPEs[:ROUND_TRIP]
      depart_date   = (Date.today + 1)
      return_date   = (Date.today + 2)
      adult         = 1
      child         = 0
      infant        = 0
      uri           = 'https://wl-prod.sabresonicweb.com'
      params        = SearchFlight::SearchParams
                      .new(ori_code, des_code, round_type, depart_date,
                      return_date, adult.to_s, child.to_s, infant.to_s)
      http_service  = Http::HttpFactory.new_http
      search_builder  = SearchFlight::Vna::SearchFlightBuilder
                      .new(uri, params)
      search_flight_req  = SearchFlight::Vna::SearchFlightRequest
                      .new(search_builder, http_service)
      response      = search_flight_req.call

      it 'return status 200' do
        expect(response.code).to eq(200)
      end

      it 'return html content that contains "Bảng chi tiết chuyến bay" text' do
        # File.open('/Users/Dona/Desktop/untitled.html', 'w')
        # {|f| f.write(response) }
        expect(response).to include 'Bảng chi tiết chuyến bay'
      end
    end
  end
end
