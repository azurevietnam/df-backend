require 'rails_helper'

RSpec.describe Order::GetCustomerOrder do
  describe "#call" do
    context "when customer exist in system" do
      before(:each) do
        @contact_info = double("Order::ContactInfo")
        @existed_customer = FactoryGirl.create(:customer)
        @customer = Order::GetCustomerOrder.new.call(@existed_customer.id, @contact_info)
      end
      it "return existed customer" do
        expect(@customer.id).to eql @existed_customer.id
      end
    end
    context "when cannot find customer in system" do
      before(:each) do
        @contact_info = Order::ContactInfo.new("01222222222", "contactperson@gmail.com", "Alex Song", Customer.GENDERs[:MALE])
        @customer = Order::GetCustomerOrder.new.call(nil, @contact_info)
      end
      it "return new customer" do
        expect(@customer.id).to eql nil
        expect(@customer.phone).to eql @contact_info.phone
        expect(@customer.name).to eql @contact_info.name
        expect(@customer.gender).to eql @contact_info.gender
        expect(@customer.email).to eql @contact_info.email
      end
    end
  end
end