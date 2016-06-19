class Order::GetCustomerOrder
  attr_reader :customer
  
  def call(customer_id, contact_info)
    if !customer_id.nil?
      customer = Customer.find(customer_id)
    end
    if customer.nil?
      customer = Customer.where(phone: contact_info.phone).first_or_initialize do |c|
        c.name = contact_info.name
        c.email = contact_info.email
        c.gender = contact_info.gender
      end
    end
    customer
  end
end