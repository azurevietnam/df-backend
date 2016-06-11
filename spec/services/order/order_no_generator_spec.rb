require 'rails_helper'

RSpec.describe Order::OrderNoGenerator do
  describe "#call" do
    context "when generate order number success" do
      before(:each) do
        @order_no = Order::OrderNoGenerator.new.call()
      end
      it "return 8 charactors" do
        expect(@order_no.length).to eql 8
      end
    end
  end
end