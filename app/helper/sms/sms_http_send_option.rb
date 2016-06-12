class Sms::SmsHttpSendOption
  def self.get_options(auth, sms_content, *to_phone)
    sms_type = 2  # CSKH - can change later
    options = { 
      basic_auth: auth,
      body: {
        "to" => to_phone,
        "content" => sms_content,
        "sms_tye" => sms_type,
        "brandname" => ""
      }.to_json,
      headers: {
        "Content-Type" => "application/json"
      }
    }
    
    options
  end
end