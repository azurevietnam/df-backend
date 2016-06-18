require 'rails_helper'

RSpec.describe SearchFlight::Vje::Search do
  # ori_code      = 'SGN'
  # des_code      = 'HAN'
  # depart_date   = (Date.today + 1)
  # adult         = 1
  # child         = 0
  # infant        = 0

  # describe 'search flights for vietnam airline' do
  #   context 'search one way successfully' do
  #     round_type       = Order.ROUND_TYPEs[:ONE_WAY]
  #     return_date      = nil
  #     params           = SearchFlight::SearchParams.new(ori_code, des_code, round_type, depart_date, return_date, adult, child, infant)
  #     search           = SearchFlight::Vje::Search.new(params)
  #     flight_container = search.call

  #     it 'return depart flights only' do
  #       expect(flight_container.return_flights).to be_nil
  #     end
  #     it 'return correct value type of flight when have depart flights' do
  #       if !flight_container.depart_flights.nil? && flight_container.depart_flights.count > 0
  #         flight = flight_container.depart_flights[0]
  #         expect(flight.airline_type).to eq(Airline.CATEGORies[:VIETJET])
  #         expect(flight.from_time).to match(/\d{1,2}:\d{1,2}/)
  #         expect(flight.to_time).to match(/\d{1,2}:\d{1,2}/)
  #       end
  #     end
  #   end

  #   context 'search round trip successfully' do
  #     # not implement
  #   end
  # end
end
