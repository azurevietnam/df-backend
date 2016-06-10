require 'rails_helper'

RSpec.describe Helper::DateFormatter do
  describe "#format" do
    context "format correct" do
      time = Time.now
      it "return correct format" do
        expect(Helper::DateFormatter.format_date_time(time)).to eq time.strftime("%H:%M %d/%m/%Y")
        expect(Helper::DateFormatter.format_date(time)).to eq time.strftime("%d/%m/%Y")
        expect(Helper::DateFormatter.format_time(time)).to eq time.strftime("%H:%M")
        expect(Helper::DateFormatter.format_with_user_defined(time, "%H:%M %d-%m-%y")).to eq time.strftime("%H:%M %d-%m-%y")
      end
    end
  end
end