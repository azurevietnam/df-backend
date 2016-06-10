class Passenger < ActiveRecord::Base
  include Gender
  
  belongs_to :order
end
