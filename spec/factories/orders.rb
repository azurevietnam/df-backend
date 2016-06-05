FactoryGirl.define do
  factory :order do
    order_number OrdersController.new.generate_order_number
    contact_email {FFaker::Internet.email}
  end
end