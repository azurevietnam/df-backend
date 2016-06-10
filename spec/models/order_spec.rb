require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "#send_reservation_email" do
    context "when send reservation email success" do
      subject {FactoryGirl.create(:order)}
      it "increase ActionMailer delivery array by 1" do
        expect{subject.send_reservation_email}.to change{ ActionMailer::Base.deliveries.count }.by(1)
      end
    end
  end
end