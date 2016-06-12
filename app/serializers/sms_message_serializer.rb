class SmsMessageSerializer < ActiveModel::Serializer
  attributes :id, :order_id, :type, :content, :to_phone, :trans_id, :total_sms, :total_price
end
