FactoryGirl.define do
  sequence :phone do |n|
    # FFaker::PhoneNumber.subscriber_number(10)
  end
  sequence :email do |n|
    FFaker::Internet.email
  end

  factory :customer do
    name { FFaker::Name.name }
    phone "01223344509"
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