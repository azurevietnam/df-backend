FactoryGirl.define do
  sequence :phone do |n|
    FFaker::PhoneNumber.subscriber_number(10)
  end
  sequence :email do |n|
    FFaker::Internet.email
  end

  factory :customer do
    name { FFaker::Name.name }
    phone "01224410620"
    email
    gender 1
  end
end