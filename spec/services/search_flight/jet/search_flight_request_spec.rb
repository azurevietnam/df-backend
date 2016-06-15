require 'rails_helper'

RSpec.describe SearchFlight::Jet::SearchFlightRequest do
  describe 'send search ticket request to Jetstar website' do
    context 'search ticket round trip successfully' do
      ori_code            = 'SGN'
      des_code            = 'HAN'
      round_type          = Order.ROUND_TYPEs[:ROUND_TRIP]
      depart_date         = (Date.today + 1)
      return_date         = (Date.today + 2)
      adult               = 1
      child               = 0
      infant              = 0
      uri                 = 'http://booknow.jetstar.com'
      params              = SearchFlight::SearchParams
                            .new(ori_code, des_code, round_type, depart_date,
                            return_date, adult.to_s, child.to_s, infant.to_s)
      http_service        = Http::HttpService.new
      search_builder      = SearchFlight::Jet::SearchFlightBuilder
                            .new(uri, params)
      search_flight_req   = SearchFlight::Jet::SearchFlightRequest
                            .new(search_builder, http_service)
      response            = search_flight_req.call

      it 'return content that includes some verified keywords' do
        # File.open('/Users/Dona/Desktop/untitled.html', 'w') {|f| f.write(response) }
        expect(response).to include ori_code
        expect(response).to include des_code
        expect(response).to include 'Lựa chọn chuyến bay chặng đi'
        expect(response).to include 'Lựa chọn chuyến bay chặng về'
      end

      it 'return status 200' do
        expect(response.code).to eq(200)
      end
    end

    sleep(10.seconds) # prevent 2 requests from sending in short time -> Error Connection reset by peer

    context 'search ticket one way successfully' do
      ori_code            = 'SGN'
      des_code            = 'HAN'
      round_type          = Order.ROUND_TYPEs[:ONE_WAY]
      depart_date         = (Date.today + 1)
      return_date         = nil
      adult               = 1
      child               = 0
      infant              = 0
      uri                 = 'http://booknow.jetstar.com'
      params              = SearchFlight::SearchParams
                            .new(ori_code, des_code, round_type, depart_date,
                            return_date, adult.to_s, child.to_s, infant.to_s)
      http_service        = Http::HttpService.new
      search_builder      = SearchFlight::Jet::SearchFlightBuilder
                            .new(uri, params)
      search_flight_req   = SearchFlight::Jet::SearchFlightRequest
                            .new(search_builder, http_service)
      response            = search_flight_req.call

      it 'return content that includes some verified keywords' do
        # File.open('/Users/Dona/Desktop/untitled.html', 'w') {|f| f.write(response) }
        expect(response).to include ori_code
        expect(response).to include des_code
        expect(response).to include 'Lựa chọn chuyến bay chặng đi'
        expect(response).not_to include 'Lựa chọn chuyến bay chặng về'
      end

      it 'return status 200' do
        expect(response.code).to eq(200)
      end
    end
  end
end
