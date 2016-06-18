require 'rails_helper'

RSpec.describe SearchFlight::Jet::Request do
  describe 'send search ticket request to Jetstar website', http: true do
    # context 'search ticket round trip successfully', http: true do
    #   ori_code            = 'SGN'
    #   des_code            = 'HAN'
    #   round_type          = Order.ROUND_TYPEs[:ROUND_TRIP]
    #   depart_date         = (Date.today + 1)
    #   return_date         = (Date.today + 2)
    #   adult               = 1
    #   child               = 0
    #   infant              = 0
    #   uri                 = 'http://booknow.jetstar.com'
    #   params              = SearchFlight::SearchParams.new(ori_code, des_code, round_type, depart_date, return_date, adult, child, infant)
    #   http_service        = Http::HttpService.new
    #   option_builder      = SearchFlight::Jet::OptionBuilder.new(uri, params)
    #   # search_flight_req   = SearchFlight::Jet::Request.new(option_builder, http_service)
    #   # response_data       = search_flight_req.call
    #   byebug
    #   response_data = Http::SearchFlightService.search(option_builder.url, option_builder.options)

    #   it 'return content that includes some verified keywords' do
    #     # File.open('/Users/Dona/Desktop/untitled.html', 'w') {|f| f.write(response_data) }
    #     expect(response_data).to include ori_code
    #     expect(response_data).to include des_code
    #     expect(response_data).to include 'Lựa chọn chuyến bay chặng đi'
    #     expect(response_data).to include 'Lựa chọn chuyến bay chặng về'
    #   end

    #   it 'return status 200' do
    #     expect(response_data.code).to eq(200)
    #   end
    # end

    # sleep(10.seconds) # prevent 2 requests from sending in short time -> Error Connection reset by peer

    # context 'search ticket one way successfully', http: true do
    #   ori_code            = 'SGN'
    #   des_code            = 'HAN'
    #   round_type          = Order.ROUND_TYPEs[:ONE_WAY]
    #   depart_date         = (Date.today + 1)
    #   return_date         = nil
    #   adult               = 1
    #   child               = 0
    #   infant              = 0
    #   uri                 = 'http://booknow.jetstar.com'
    #   params              = SearchFlight::SearchParams
    #                         .new(ori_code, des_code, round_type, depart_date,
    #                         return_date, adult, child, infant)
    #   http_service        = Http::HttpService.new
    #   option_builder      = SearchFlight::Jet::OptionBuilder
    #                         .new(uri, params)
    #   search_flight_req   = SearchFlight::Jet::Request
    #                         .new(option_builder, http_service)
    #   response_data            = search_flight_req.call

    #   it 'return content that includes some verified keywords' do
    #     File.open('/Users/Dona/Desktop/untitled.html', 'w') {|f| f.write(response_data) }
    #     expect(response_data).to include ori_code
    #     expect(response_data).to include des_code
    #     expect(response_data).to include 'Lựa chọn chuyến bay chặng đi'
    #     expect(response_data).not_to include 'Lựa chọn chuyến bay chặng về'
    #   end

    #   it 'return status 200' do
    #     expect(response_data.code).to eq(200)
    #   end
    # end
  end
end
