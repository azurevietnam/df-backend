class Place < ActiveRecord::Base
  has_many :order_ori, class_name: "Order", foreign_key: "ori_place_id"
  has_many :order_des, class_name: "Order", foreign_key: "des_place_id"
end
