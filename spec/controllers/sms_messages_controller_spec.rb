require 'rails_helper'

RSpec.describe SmsMessagesController, type: :controller do
  describe "#create" do
    context "create sms message success" do
      before(:each) do
        @order = FactoryGirl.create(:order)
        @sms_message_type = SmsMessage.CATEGORies[:RES]
        post :create, sms_message: {
          order_id: @order.id,
          sms_message_type: @sms_message_type
        }
        @sms_response = json_response
      end
      
      it "render correct sms message response" do
        expect(@sms_response[:id]).not_to eql nil
        expect(@sms_response[:order_id]).to eql @order.id
        expect(@sms_response[:type]).to eql @sms_message_type
        expect(@sms_response[:to_phone]).to eql @order.contact_phone
      end
      
      it { should respond_with :created }
    end
    
    context "create sms message failed when sms type not supported" do
      before(:each) do
        @order = FactoryGirl.create(:order)
        @sms_message_type = -1
        post :create, sms_message: {
          order_id: @order.id,
          sms_message_type: @sms_message_type
        }
      end
      
      it { should respond_with :unprocessable_entity }
    end
  end
end
