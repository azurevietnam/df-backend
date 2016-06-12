class SmsMessage < ActiveRecord::Base
  belongs_to :order
  
  enum CATEGORY: {RES: 1, EXP: 2}
end
