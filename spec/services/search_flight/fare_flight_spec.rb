require 'rails_helper'

RSpec.describe SearchFlight::FareFlight do
  describe 'calculate price for one flight' do
    context 'calculate for jetstar airline' do
      fare_formula = SearchFlight::FareFormulaFactory.get_formula(Airline.CATEGORies[:JETSTAR])
      flight = Flight::Flight.new
      flight.price_web = 960000
      fare_flight = SearchFlight::FareFlight.new(fare_formula)
      fare_flight.call(flight)
      it 'return correct price value for flight' do
        expect(flight.price_adult).to eq(1246000)
        expect(flight.price_child).to eq(1206000)
        expect(flight.price_infant).to eq(150000)
      end
    end

    context 'calculate for vietnam airline' do
      fare_formula = SearchFlight::FareFormulaFactory.get_formula(Airline.CATEGORies[:VNAIRLINE])
      flight = Flight::Flight.new
      flight.price_web = 960000
      fare_flight = SearchFlight::FareFlight.new(fare_formula)
      fare_flight.call(flight)
      it 'return correct price value for flight' do
        expect(flight.price_adult).to eq(1136000)
        expect(flight.price_child).to eq(832000)
        expect(flight.price_infant).to eq(105600)
      end
    end

    context 'calculate for vietjet airline' do
      fare_formula = SearchFlight::FareFormulaFactory.get_formula(Airline.CATEGORies[:VIETJET])
      flight = Flight::Flight.new
      flight.price_web = 960000
      fare_flight = SearchFlight::FareFlight.new(fare_formula)
      fare_flight.call(flight)
      it 'return correct price value for flight' do
        expect(flight.price_adult).to eq(1246000)
        expect(flight.price_child).to eq(1206000)
        expect(flight.price_infant).to eq(0)
      end
    end
  end
end
