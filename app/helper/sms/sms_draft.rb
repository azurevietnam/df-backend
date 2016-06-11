class Sms::SmsDraft
  def self.show
    "Hello Dona"
  end
  
  def self.check_account
    auth = {
      username: "gd1baqlyEtypy6XzOMvUXTzihV0cC3HK",
      password: ""
    }
    options = { basic_auth: auth }
    response = HTTParty.get("http://api.speedsms.vn/index.php/user/info", options)
    response
  end
  
  def self.send_sms
    auth = {
      username: "gd1baqlyEtypy6XzOMvUXTzihV0cC3HK",
      password: ""
    }
    options = { 
      basic_auth: auth,
      body: {
        "to" => ["0933554440"],
        "content" => "Xin chao Dona",
        "sms_tye" => "2",
        "brandname" => ""
      }.to_json,
      headers: {
        "Content-Type" => "application/json"
      }
    }
    response = HTTParty.post('http://api.speedsms.vn/index.php/sms/send', options)
  end
end