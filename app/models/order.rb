class Order < ActiveRecord::Base
  validates :order_number, presence: true
  validates :order_number, uniqueness: true
  validates_email_format_of :contact_email, :message => 'is not looking good'

  belongs_to :customer
  has_many :order_paxes
end
