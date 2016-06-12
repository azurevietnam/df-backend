require 'rails_helper'

RSpec.describe Sms::SmsPassengersFormatter do
  describe "#format" do
    context "when format success" do
      before(:each) do
        order = FactoryGirl.create(:order)
        @passengers = [FactoryGirl.create(:passenger, no: 1, order: order), FactoryGirl.create(:passenger, no: 2, order: order)]
        @passenger_str = ""
        @passengers.each do |passenger|
          @passenger_str << passenger.name.upcase << ","
        end
        @passenger_str = @passenger_str.chomp(",")
      end
      it "return name of person title correctly" do
        expect(Sms::SmsPassengersFormatter.format(@passengers)).to eq @passenger_str
      end
    end
  end
end