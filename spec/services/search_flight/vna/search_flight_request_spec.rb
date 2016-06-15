require 'rails_helper'

RSpec.describe SearchFlight::Vna::SearchFlightRequest do
  describe 'send search request to Vietnam airline website' do
    context 'send request successfully' do
      @uri = 'https://wl-prod.sabresonicweb.com'
      @params = SearchFlight::SearchParams.new('SGN', 'DAD', Order.ROUND_TYPEs[:ROUND_TRIP],
                Date.strptime('03/10/2016', '%d/%m/%Y'), Date.strptime('13/10/2016', '%d/%m/%Y'), '1', '0', '0')
      @http_service = Http::HttpFactory.new_http
      @search_builder = SearchFlight::Vna::SearchFlightBuilder.new(@uri, @params)
      @search_flight_req = SearchFlight::Vna::SearchFlightRequest.new(@search_builder, @http_service)
      response = @search_flight_req.call

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
