require 'rails_helper'

RSpec.describe Helper::CurrencyHelper do
  describe "#format" do
    context "when format correct with default unit" do
      it "return correct currency format" do
        expect(Helper::CurrencyHelper.format(200000)).to eq "200,000 VND"
      end
    end
    context "when format correct with user-defined unit" do
      it "return correct currency format" do
        expect(Helper::CurrencyHelper.format(200000, "d")).to eq "200,000 d"
      end
    end
    context "when rounding with float number correctly" do
      it "return number with precision is 0" do
        expect(Helper::CurrencyHelper.format(200000.529)).to eq "200,001 VND"
        expect(Helper::CurrencyHelper.format(200000.199)).to eq "200,000 VND"
      end
    end
  end
end