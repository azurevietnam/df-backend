require 'rails_helper'

RSpec.describe SearchFlight::ParseFlight do
  describe 'parse flights' do
    context 'parse one way vietnam airline' do
      content      = File.open(Rails.root.join('spec', 'services', 'search_flight', 'vna', 'use_cases', 'one_way.html')) { |f| f.read}
      html_content = Nokogiri::HTML(content)
      parse_unit   = SearchFlight::Vna::ParseUnit.new
      parse_flight = SearchFlight::ParseFlight.new(parse_unit, html_content)

      it 'format correct type of each information flight' do
        flights = parse_flight.flights('#dtcontainer-both tbody tr')
        flight = flights[0]
        expect(flight.airline_type).to eq(Airline.CATEGORies[:VNAIRLINE])
        expect(flight.from_time).to match(/\d{1,2}:\d{1,2}/)
        expect(flight.to_time).to match(/\d{1,2}:\d{1,2}/)
      end
    end

    context 'parse one way vietjet' do
      content      = File.open(Rails.root.join('spec', 'services', 'search_flight', 'vje', 'use_cases', 'one_way.html')) { |f| f.read}
      html_content = Nokogiri::HTML(content)
      parse_unit   = SearchFlight::Vje::ParseUnit.new
      parse_flight = SearchFlight::ParseFlight.new(parse_unit, html_content)

      it 'format correct type of each information flight' do
        flights = parse_flight.flights('.FlightsGrid tr[id*=gridTravel]')
        flight = flights[0]
        expect(flight.airline_type).to eq(Airline.CATEGORies[:VIETJET])
        expect(flight.from_time).to match(/\d{1,2}:\d{1,2}/)
        expect(flight.to_time).to match(/\d{1,2}:\d{1,2}/)
      end
    end

    context 'parse one way jetstar' do
      content      = File.open(Rails.root.join('spec', 'services', 'search_flight', 'jet', 'use_cases', 'one_way.html')) { |f| f.read}
      html_content = Nokogiri::HTML(content)
      parse_unit   = SearchFlight::Jet::ParseUnit.new
      parse_flight = SearchFlight::ParseFlight.new(parse_unit, html_content)

      it 'format correct type of each information flight' do
        flights = parse_flight.flights('div.fares table.domestic tbody tr:not(.business-options):not(.starter-options)')
        flight = flights[0]
        expect(flight.airline_type).to eq(Airline.CATEGORies[:JETSTAR])
        expect(flight.from_time).to match(/\d{1,2}:\d{1,2}/)
        expect(flight.to_time).to match(/\d{1,2}:\d{1,2}/)
      end
    end
  end
end
