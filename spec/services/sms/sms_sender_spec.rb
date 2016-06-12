require 'rails_helper'

RSpec.describe Sms::SmsSender do
  describe "#call" do
    context "when send sms success" do
      before(:each) do
        @sms_content = "Content message"
        @to_phone = ["093333331"]
        sms_sender = Sms::SmsSender.new(@sms_content, @to_phone)
        @response = sms_sender.send
      end
      
      it "return success response" do
        expect(@response).to be_an_instance_of(Response::Success)
        expect(@response.data[:status]).to eql "success"
        expect(@response.data[:code]).to eql "00"
      end
    end
  end
end