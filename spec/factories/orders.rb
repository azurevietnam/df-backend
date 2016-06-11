FactoryGirl.define do
  sequence :contact_email do |n|
    FFaker::Internet.email
  end
  sequence :contact_name do |n|
    FFaker::Name.name
  end
  
  factory :order do
    order_number Order::OrderNoGenerator.new.call
    customer
    contact_name
    contact_phone "09354554421"
    contact_email "coder.leo.le@gmail.com"
    contact_gender { [Customer.GENDERs[:MALE], Customer.GENDERs[:FEMALE]].sample }
    
    trait :one_way do
      round_type Order.ROUND_TYPEs[:ONE_WAY]
    end
    
    trait :round_trip do
      round_type Order.ROUND_TYPEs[:ROUND_TRIP]
    end

    after(:build) do |order|
      ori_place = FactoryGirl.build(:place_bmt)
      des_place = FactoryGirl.build(:place_sgn)
      depart_airline = FactoryGirl.build(:airline_jet)
      return_airline = FactoryGirl.build(:airline_vjet)
      
      # order.ori_place_id = ori_place.id
      order.ori_code = ori_place.code
      order.ori_name = ori_place.name
      order.ori_short_name = ori_place.short_name
      order.ori_name_unsigned = ori_place.name_unsigned
      # order.des_place_id = des_place.id
      order.des_code = des_place.code
      order.des_name = des_place.name
      order.des_short_name = des_place.short_name
      order.des_name_unsigned = des_place.name_unsigned
      
      # order.depart_airline_id = depart_airline.id
      order.depart_airline_name =  depart_airline.name
      order.depart_airline_short_name = depart_airline.short_name
      order.depart_airline_type = depart_airline.category
      # order.return_airline_id = return_airline.id
      order.return_airline_name =  return_airline.name
      order.return_airline_short_name = return_airline.short_name
      order.return_airline_type = return_airline.category
      
      order.passengers << FactoryGirl.build_list(:passenger, order.adult, :adult, order: order)
      order.passengers << FactoryGirl.build_list(:passenger, order.child, :child, order: order)
      order.passengers << FactoryGirl.build_list(:passenger, order.infant, :infant, order: order)
    end

    adult   2
    child   2
    infant  1
    
    trait :status_cancel do
      status = Order.STATUSes[:CANCEL]
    end
    trait :status_new do
      status = Order.STATUSes[:NEW]
    end
    trait :status_reserved do
      status = Order.STATUSes[:RESERVED]
    end
    trait :status_done do
      status = Order.STATUSes[:DONE]
    end
    
    depart_flight_code    "VJ123"
    depart_date           Date.new(2016, 11, 20)
    depart_from_time      Time.local(2016,10,25,10,20,0)
    depart_to_time        Time.local(2016,10,25,12,0,0)
    depart_book_code      "234543"
    depart_web_price_net  500000
    depart_total          500000
    depart_expired        Time.local(2016, 12, 10, 20, 10, 0)
    return_flight_code    "BL534"
    return_date           Date.new(2016, 12, 10)
    return_from_time      Time.local(2016,10,25,14,20,0)
    return_to_time        Time.local(2016,10,25,15,30,0)
    return_book_code      "F45JHKBF"
    return_web_price_net  400000
    return_total          400000
    return_expired        Time.local(2016, 12, 10, 20, 10, 0)
    total_price           900000
    contact_note          "Contact note"
    admin_note            "Admin note"
    time_expired          Time.local(2016, 12, 10, 20, 10, 0)
    created_at            Time.local(2016, 10, 5, 9, 9, 0)
    updated_at            Time.local(2016, 10, 5, 9, 9, 0)
  end
end