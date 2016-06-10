require 'rails_helper'

RSpec.describe Customer::Title do
  describe "#show" do
    context "when show correctly" do
      it "return name of person title correctly" do
        expect(Customer::Title.show(Customer.GENDERs[:MALE])).to eq "Ông"
        expect(Customer::Title.show(Customer.GENDERs[:FEMALE])).to eq "Bà"
      end
    end
  end
end