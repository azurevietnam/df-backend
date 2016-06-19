class Sms::SmsSender
  def initialize(sms_content, *to_phone)
    @to_phone = to_phone
    @sms_content = sms_content
  end
  
  def send
    uri = "http://api.speedsms.vn/index.php/sms/send"
    auth = Sms::SmsAuthen.get_auth
    options = Sms::SmsHttpSendOption.get_options(auth, @sms_content, @to_phone)
    http_service = Http::HttpFactory.new_http
    begin
      if (ENV['RAILS_ENV'] == "development" || ENV['RAILS_ENV'] == "test")
        sms_response = { status: "success", code: "00", data: { tranId: "123", totalSMS: "2", totalPrice: "2", invalidPhone: "" } }
      elsif (ENV['RAILS_ENV'] == "production")
        sms_response = http_service.post(uri, options)
      end
      
      @response = Response::Success.new(data: sms_response)
    rescue Exception => ex
      @response = Response::Error.new(error_type: ex, message: ex.message)
    end
    @response
  end
end