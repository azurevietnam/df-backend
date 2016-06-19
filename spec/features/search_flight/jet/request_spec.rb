require 'rails_helper'

RSpec.describe SearchFlight::Jet::Request do
  describe 'send search ticket request to Jetstar website', http: true do
    ori_code            = 'SGN'
    des_code            = 'HAN'
    depart_date         = (Date.today + 1)
    adult               = 1
    child               = 0
    infant              = 0
    uri                 = 'http://booknow.jetstar.com'
    http_service        = Http::HttpService.new

    context 'search ticket round trip successfully', http: true do
      before(:each) do
        round_type     = Order.ROUND_TYPEs[:ROUND_TRIP]
        return_date    = (Date.today + 2)
        params         = SearchFlight::SearchParams.new(ori_code, des_code, round_type, depart_date, return_date, adult, child, infant)
        option_builder = SearchFlight::Jet::OptionBuilder.new(uri, params)
        request        = SearchFlight::Jet::Request.new(option_builder, http_service)

        VCR.use_cassette('search_flight/jet/round_trip') do
          @response_data  = request.call.data
        end
      end

      it 'return content that includes some verified keywords' do
        # File.open(Rails.root.join('spec', 'services', 'search_flight', 'jet', 'save_response', 'round_trip.txt'), 'w') {|f| f.write(response_data) }
        expect(@response_data).to include ori_code
        expect(@response_data).to include des_code
        expect(@response_data).to include 'Lựa chọn chuyến bay chặng đi'
        expect(@response_data).to include 'Lựa chọn chuyến bay chặng về'
      end

      it 'return status 200' do
        expect(@response_data.code).to eq(200)
      end
    end

    context 'search ticket one way successfully', http: true do
      before(:each) do
        round_type     = Order.ROUND_TYPEs[:ONE_WAY]
        return_date    = nil
        params         = SearchFlight::SearchParams.new(ori_code, des_code, round_type, depart_date, return_date, adult, child, infant)
        http_service   = Http::HttpFactory.new_http
        option_builder = SearchFlight::Jet::OptionBuilder.new(uri, params)
        request        = SearchFlight::Jet::Request.new(option_builder, http_service)

        VCR.use_cassette('search_flight/jet/one_way') do
          @response_data  = request.call.data
        end
      end

      it 'return content that includes some verified keywords' do
        # File.open(Rails.root.join('spec', 'services', 'search_flight', 'jet', 'save_response', 'one_way.txt'), 'w') {|f| f.write(response_data) }
        expect(@response_data).to include ori_code
        expect(@response_data).to include des_code
        expect(@response_data).to include 'Lựa chọn chuyến bay chặng đi'
        expect(@response_data).not_to include 'Lựa chọn chuyến bay chặng về'
      end

      it 'return status 200' do
        expect(@response_data.code).to eq(200)
      end
    end
  end
end
