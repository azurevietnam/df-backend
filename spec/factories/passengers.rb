FactoryGirl.define do
  sequence :no do |n|
    n + 1
  end

  factory :passenger do
    name { FFaker::Name.name }
    depart_lug_weight 0
    return_lug_weight 0

    factory(:male_adult) do
      category Passenger.CATEGORies[:ADULT]
      gender Customer.GENDERs[:MALE]
      birth "20/07/1992"
    end

    factory(:female_adult) do
      category Passenger.CATEGORies[:ADULT]
      gender Customer.GENDERs[:FEMALE]
      birth "15/09/1991"
    end

    factory(:male_child) do
      category Passenger.CATEGORies[:CHILD]
      gender Customer.GENDERs[:MALE]
      birth "20/07/2010"
    end

    factory(:female_child) do
      category Passenger.CATEGORies[:CHILD]
      gender Customer.GENDERs[:FEMALE]
      birth "20/07/2011"
    end

    factory(:male_infant) do
      category Passenger.CATEGORies[:INFANT]
      gender Customer.GENDERs[:MALE]
      birth "20/07/2015"
    end

    factory(:female_infant) do
      category Passenger.CATEGORies[:INFANT]
      gender Customer.GENDERs[:FEMALE]
      birth "20/07/2015"
    end
  end
end