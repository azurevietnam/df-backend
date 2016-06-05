class Passenger < ActiveRecord::Base
  belongs_to :order

  enum CATEGORY: {ADULT: 1, CHILD: 2, INFANT: 3}
end
