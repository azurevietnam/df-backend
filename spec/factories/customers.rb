FactoryGirl.define do
  sequence :phone do |n|
    # FFaker::PhoneNumber.subscriber_number(10)
    "012244106#{n}"
  end
  sequence :email do |n|
    FFaker::Internet.email
  end

  factory :customer do
    name { FFaker::Name.name }
    phone
    email
    gender { [Customer.GENDERs[:MALE], Customer.GENDERs[:FEMALE]].sample }
    trait :male do
      gender Customer.GENDERs[:MALE]      
    end
    trait :female do
      gender Customer.GENDERs[:FEMALE]
    end
    
  end
end