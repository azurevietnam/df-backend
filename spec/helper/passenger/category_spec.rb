require 'rails_helper'

RSpec.describe Passenger::Category do
  describe "#name" do
    context "when pass correct person type (category)" do
      it "return name of person type" do
        expect(Passenger::Category.name(Passenger.CATEGORies[:ADULT])).to eq "Người lớn"
        expect(Passenger::Category.name(Passenger.CATEGORies[:CHILD])).to eq "Trẻ em"
        expect(Passenger::Category.name(Passenger.CATEGORies[:INFANT])).to eq "Em bé"
      end
    end
  end
end