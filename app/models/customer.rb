class Customer < ActiveRecord::Base
  validates :name, :phone, :email, :gender, presence: true
  validates :phone, :email, uniqueness: true
  validates_email_format_of :email, :message => 'is not looking good'

  has_many :orders
end
