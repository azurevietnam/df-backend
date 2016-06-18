require 'rails_helper'

RSpec.describe SearchFlight::Vna::Request do
  # describe 'send search ticket request to Vietnam airline website' do
  #   context 'search ticket round trip successfully', http: true do
  #     ori_code      = 'SGN'
  #     des_code      = 'HAN'
  #     round_type    = Order.ROUND_TYPEs[:ROUND_TRIP]
  #     depart_date   = (Date.today + 1)
  #     return_date   = (Date.today + 2)
  #     adult         = 1
  #     child         = 0
  #     infant        = 0
  #     uri           = 'https://wl-prod.sabresonicweb.com'
  #     params        = SearchFlight::SearchParams
  #                     .new(ori_code, des_code, round_type, depart_date,
  #                     return_date, adult, child, infant)
  #     http_service  = Http::HttpFactory.new_http
  #     search_builder  = SearchFlight::Vna::OptionBuilder
  #                     .new(uri, params)
  #     search_flight_req  = SearchFlight::Vna::Request
  #                     .new(search_builder, http_service)
  #     response_data      = search_flight_req.call.data

  #     it 'return status 200' do
  #       expect(response_data.code).to eq(200)
  #     end

  #     it 'return content that includes some verified keywords' do
  #       # File.open('/Users/Dona/Desktop/untitled.html', 'w') {|f| f.write(response_data) }
  #       expect(response_data).to include ori_code
  #       expect(response_data).to include des_code
  #       expect(response_data).to include 'Bảng chi tiết chuyến bay'
  #       expect(response_data).to include 'Lựa chọn CHUYẾN BAY CHIỀU ĐI'
  #       expect(response_data).to include 'Lựa chọn CHUYẾN BAY CHIỀU VỀ'
  #     end
  #   end
  #   context 'search ticket one way successfully', http: true do
  #     ori_code      = 'SGN'
  #     des_code      = 'HAN'
  #     round_type    = Order.ROUND_TYPEs[:ONE_WAY]
  #     depart_date   = (Date.today + 1)
  #     return_date   = nil
  #     adult         = 1
  #     child         = 0
  #     infant        = 0
  #     uri           = 'https://wl-prod.sabresonicweb.com'
  #     params        = SearchFlight::SearchParams
  #                     .new(ori_code, des_code, round_type, depart_date,
  #                     return_date, adult, child, infant)
  #     http_service  = Http::HttpFactory.new_http
  #     search_builder  = SearchFlight::Vna::OptionBuilder
  #                     .new(uri, params)
  #     search_flight_req  = SearchFlight::Vna::Request
  #                     .new(search_builder, http_service)
  #     response_data      = search_flight_req.call.data

  #     it 'return status 200' do
  #       expect(response_data.code).to eq(200)
  #     end

  #     it 'return content that includes some verified keywords' do
  #       # File.open('/Users/Dona/Desktop/untitled.html', 'w') {|f| f.write(response_data) }
  #       expect(response_data).to include ori_code
  #       expect(response_data).to include des_code
  #       expect(response_data).to include 'Bảng chi tiết chuyến bay'
  #       expect(response_data).to include 'Lựa chọn CHUYẾN BAY CHIỀU ĐI'
  #       expect(response_data).not_to include 'Lựa chọn CHUYẾN BAY CHIỀU VỀ'
  #     end
  #   end
  # end
end
