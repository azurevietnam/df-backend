require 'rails_helper'

RSpec.describe Passenger::Title do
  describe "#show" do
    context "when show correctly" do
      it "return name of person title correctly" do
        expect(Passenger::Title.show(Customer.GENDERs[:MALE], Passenger.CATEGORies[:ADULT])).to eq "Ông"
        expect(Passenger::Title.show(Customer.GENDERs[:MALE], Passenger.CATEGORies[:CHILD])).to eq "Em trai"
        expect(Passenger::Title.show(Customer.GENDERs[:MALE], Passenger.CATEGORies[:INFANT])).to eq "Bé trai"
        expect(Passenger::Title.show(Customer.GENDERs[:FEMALE], Passenger.CATEGORies[:ADULT])).to eq "Bà"
        expect(Passenger::Title.show(Customer.GENDERs[:FEMALE], Passenger.CATEGORies[:CHILD])).to eq "Em gái"
        expect(Passenger::Title.show(Customer.GENDERs[:FEMALE], Passenger.CATEGORies[:INFANT])).to eq "Bé gái"
      end
    end
  end
end