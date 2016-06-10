class EmailOrder < ActionMailer::Base
  default from: "Dona Sky <donasky.com@gmail.com>"

  def reservation_order(order)
    @order = order
    mail(to: order.contact_email, subject: get_reservation_subject(order))
  end
  
  def exported_order(order)
    @order = order
    mail(to: order.contact_email, subject: get_exported_subject(order))
  end
  
  private
    def get_reservation_subject(order)
      "Giữ chỗ thành công. Mã hồ sơ #{order.order_number}"
    end
    def get_exported_subject(order)
      "Xuất vé thành công. Mã hồ sơ #{order.order_number}"
    end
end
