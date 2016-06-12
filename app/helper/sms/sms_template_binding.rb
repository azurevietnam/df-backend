class Sms::SmsTemplateBinding
  def self.get_content(order, sms_message_type)
    ori_name = order.ori_short_name
    des_name = order.des_short_name
    depart_from_time = DateFormatter.format_time(order.depart_from_time)
    depart_date = DateFormatter.format_date(order.depart_date)
    depart_airline = order.depart_airline_short_name
    depart_book_code = order.depart_book_code
    depart_flight_code  = order.depart_flight_code
    return_from_time  = ""
    return_date     = ""
    return_airline    = ""
    return_book_code  = ""
    return_flight_code  = ""
    if Order::OrderRoundType.is_round_trip(order.round_type)
      return_from_time = DateFormatter.format_time(order.return_from_time)
      return_date = DateFormatter.format_date(order.return_date)
      return_airline = order.return_airline_short_name
      return_book_code = order.return_book_code
      return_flight_code  = order.return_flight_code
    end
    total_price = CurrencyHelper.format(order.total_price, "d")
    passengers = Sms::SmsPassengersFormatter.format(order.passengers)
    time_expired = "20h10 27/10/2016"
    
    sms_reservation_one_way     = "GIU CHO mot chieu #{ ori_name }-#{ des_name }. Di #{ depart_from_time } #{ depart_date } #{ depart_airline }. #{ passengers }. Tong tien #{ total_price }. Han giu cho #{ time_expired }. Hotline 0933554440"
    sms_reservation_round_trip  = "GIU CHO khu hoi #{ ori_name }-#{ des_name }. Di #{ depart_from_time } #{ depart_date } #{ depart_airline }. Ve #{ return_from_time } #{ return_date } #{ return_airline }. #{ passengers }. Tong tien #{ total_price }. Han giu cho #{ time_expired }. Hotline 0933554440"
    sms_exported_one_way        = "DAT VE THANH CONG. Mot chieu #{ ori_name }-#{ des_name }. Di #{ depart_book_code } #{ depart_from_time } #{ depart_date } #{ depart_airline }(#{ depart_flight_code }).#{ passengers }. Hotline 0933554440"
    sms_exported_round_trip     = "DAT VE THANH CONG. Khu hoi #{ ori_name }-#{ des_name }. Di #{ depart_book_code } #{ depart_from_time } #{ depart_date } #{ depart_airline }(#{ depart_flight_code }). Ve #{ return_book_code } #{ return_from_time } #{ return_date } #{ return_airline }(#{ return_flight_code }). #{ passengers }. Hotline 0933554440"
    
    if sms_message_type == SmsMessage.CATEGORies[:RES]
      if Order::OrderRoundType.is_round_trip(order.round_type)
        sms_content = sms_reservation_round_trip
      else
        sms_content = sms_reservation_one_way
      end
    elsif sms_message_type == SmsMessage.CATEGORies[:EXP]
      if Order::OrderRoundType.is_round_trip(order.round_type)
        sms_content = sms_exported_round_trip
      else
        sms_content = sms_exported_one_way
      end
    else
      raise ArgumentError.new("sms_message_type type not found")
    end
    
    sms_content
  end
end