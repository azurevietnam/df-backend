# Preview all emails at http://localhost:3000/rails/mailers/email_order
class EmailOrderPreview < ActionMailer::Preview
  def reservation_order_preview
    EmailOrder.reservation_order
  end
end
