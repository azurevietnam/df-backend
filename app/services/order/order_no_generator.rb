class Order::OrderNoGenerator
  def call
    order_no = nil
    loop do
      order_no = SecureRandom.hex(16/4).upcase
      break unless Order.exists?(:order_number => order_no)
    end
    order_no
  end
end