require "rails_helper"

RSpec.describe EmailOrder, type: :mailer do
  describe "#reservation_order" do
    context "when send email success" do
      
      let(:order) { FactoryGirl.build(:order, :status_reserved, :one_way) }
      let(:mail) { described_class.reservation_order(order).deliver_now }
              
      it "renders correct subject" do
        expect(mail.subject).to eq("Giữ chỗ thành công. Mã hồ sơ #{order.order_number}")
      end
      
      it "renders correct email receiver" do
        expect(mail.to).to eq([order.contact_email])
      end
      
      it "renders correct email sender" do
        expect(mail.from).to eq(["donasky.com@gmail.com"])
      end
    end
  end
end
