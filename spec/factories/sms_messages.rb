FactoryGirl.define do
  factory :sms_message do
    order_id 1
    type 1
    content "MyString"
    to_phone "MyString"
    trans_id 1
    total_sms 1
    total_price 1
  end
end
