class Customer < ActiveRecord::Base
  validates :name, :phone, :email, :gender, presence: true
  validates :phone, :email, uniqueness: {case_sensitive: false}
  validates_email_format_of :email, :message => 'is not looking good'
  # validates :phone, length: {minimum: 10, maximum: 11}
  validates :phone, format: {with: /\A[+-]?\d+{10,11}\Z/, message: 'only allow numbers'}
  has_many :orders

  enum GENDER: {MALE: 1, FEMALE: 2}
end
