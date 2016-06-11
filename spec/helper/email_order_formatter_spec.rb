require 'rails_helper'

RSpec.describe EmailOrderFormatter do
  describe "#format" do
    context "when have checked luggage" do
      it "show default carry-on and weight of checked luggage" do
        luggage_weight = 15
        expect(EmailOrderFormatter.show_luggage(luggage_weight)).to eq "7kg xách tay + #{luggage_weight}kg ký gửi"
      end
    end
    context "when don't have checked luggage" do
      it "show default carry-on luggage only" do
        luggage_weight = 0
        expect(EmailOrderFormatter.show_luggage(luggage_weight)).to eq "7kg xách tay"
      end
    end
  end
end