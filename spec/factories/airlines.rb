FactoryGirl.define do
  factory :airline do
  end
  
  factory :airline_vna, class: Airline do
    category Airline.CATEGORies[:VNAIRLINE]
    name "Vietnam Airline"
    short_name "VNAirline"
  end
  factory :airline_jet, class: Airline do
    category Airline.CATEGORies[:JETSTAR]
      name "Jetstar"
      short_name "Jetstar"
  end
  factory :airline_vjet, class: Airline do
    category Airline.CATEGORies[:VIETJET]
      name "Vietjet Air"
      short_name "Vietjet"
  end
end