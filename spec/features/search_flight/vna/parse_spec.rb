require 'rails_helper'

RSpec.describe SearchFlight::Vna::Parse do
  describe 'parse flight info from html content' do
    @ori_code      = 'SGN'
    @des_code      = 'HAN'
    @depart_date   = (Date.today + 1)
    @adult         = 1
    @child         = 0
    @infant        = 0
    context 'parse successfully for one way html content' do
      round_type    = Order.ROUND_TYPEs[:ONE_WAY]
      @return_date   = nil
      params        = SearchFlight::SearchParams
                      .new(@ori_code, @des_code, round_type, @depart_date,
                      @return_date, @adult.to_s, @child.to_s, @infant.to_s)
      content = File.open(Rails.root.join('spec', 'services', 'search_flight', 'vna', 'use_cases', 'one_way.html')) { |f| f.read}
      parser = SearchFlight::Vna::Parse.new(content, params)

      it 'return correct number of flights' do
        flight_container = parser.parse
        expect(flight_container.depart_flights.count).to eq(22)
      end
    end

    context 'parse successfully for round trip html content' do
      round_type    = Order.ROUND_TYPEs[:ROUND_TRIP]
      @return_date   = (Date.today + 2)
      params        = SearchFlight::SearchParams
                      .new(@ori_code, @des_code, round_type, @depart_date,
                      @return_date, @adult.to_s, @child.to_s, @infant.to_s)
      content = File.open(Rails.root.join('spec', 'services', 'search_flight', 'vna', 'use_cases', 'round_trip.html')) { |f| f.read}
      parser = SearchFlight::Vna::Parse.new(content, params)

      it 'return correct number of flights' do
        flight_container = parser.parse
        expect(flight_container.depart_flights.count).to eq(24)
        expect(flight_container.return_flights.count).to eq(19)
      end
    end
  end
end
