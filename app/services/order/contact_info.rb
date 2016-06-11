class Order::ContactInfo
  attr_reader :phone, :email, :name, :gender
  
  def initialize(phone, email, name, gender)
    @phone = phone
    @email = email
    @name = name
    @gender = gender
  end
end