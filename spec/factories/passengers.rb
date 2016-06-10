FactoryGirl.define do
  sequence :no do |n|
    n + 1
  end

  factory :passenger do
    order
    
    no
    name { FFaker::Name.name }
    depart_lug_weight 0
    return_lug_weight 15
    gender { [Customer.GENDERs[:MALE], Customer.GENDERs[:FEMALE]].sample }
    
    trait :male do
      gender Customer.GENDERs[:MALE]
    end
    trait :female do
      gender Customer.GENDERs[:FEMALE]  
    end
    trait :adult do
      category Passenger.CATEGORies[:ADULT]      
    end
    trait :child do
      category Passenger.CATEGORies[:CHILD]
      birth "20/07/2010"
    end
    trait :infant do
      category Passenger.CATEGORies[:INFANT]
      birth "20/07/2015"
    end
  end
end