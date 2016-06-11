require 'rails_helper'

RSpec.describe Order::OrderRoundType do
  describe "#is_round_trip" do
    context "when round type is round trip" do
      it "return true" do
        expect(Order::OrderRoundType.is_round_trip(Order.ROUND_TYPEs[:ROUND_TRIP])).to eq true
      end
    end
    context "when round type is one way" do
      it "return false" do
        expect(Order::OrderRoundType.is_round_trip(Order.ROUND_TYPEs[:ONE_WAY])).to eq false
      end
    end
  end
  
  describe "#name" do
    context "when show name of round trip" do
      it "return correct name" do
        expect(Order::OrderRoundType.name(Order.ROUND_TYPEs[:ROUND_TRIP])).to eq "Khứ hồi"
      end
    end
    context "when show name of one way" do
      it "return correct false" do
        expect(Order::OrderRoundType.name(Order.ROUND_TYPEs[:ONE_WAY])).to eq "Một chiều"
      end
    end
  end
end