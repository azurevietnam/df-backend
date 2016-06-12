class Order < ActiveRecord::Base
  
  validates :order_number, presence: true
  validates :order_number, uniqueness: true
  validates_email_format_of :contact_email, :message => 'is not looking good'

  belongs_to :customer
  belongs_to :ori_place, class_name: 'Place', foreign_key: 'ori_place_id'
  belongs_to :des_place, class_name: 'Place', foreign_key: 'des_place_id'
  belongs_to :depart_airline, class_name: 'Airline', foreign_key: 'depart_airline_id'
  belongs_to :return_airline, class_name: 'Airline', foreign_key: 'return_airline_id'
  has_many :passengers
  has_many :sms_messages
  accepts_nested_attributes_for :passengers
  accepts_nested_attributes_for :ori_place
  accepts_nested_attributes_for :des_place

  enum STATUS: {CANCEL: 0, NEW: 1, RESERVED: 2, DONE: 3}
  enum ROUND_TYPE: {ONE_WAY: 1, ROUND_TRIP: 2}
  
  def send_reservation_email
    EmailOrder.reservation_order(self).deliver_now
  end
  
  def send_exported_email
    EmailOrder.exported_order(self).deliver_now
  end
end
