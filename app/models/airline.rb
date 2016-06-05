class Airline < ActiveRecord::Base
  has_many :order_depart, class_name: "Order", foreign_key: "depart_airline_id"
  has_many :order_return, class_name: "Order", foreign_key: "return_airline_id"

  enum CATEGORY: {VNAIRLINE: 1, JETSTAR: 2, VIETJET: 3}
end
