class Customer::Title
  def self.show(gender)
    if gender == Passenger.GENDERs[:MALE]
       return "Ông"
    else
      return "Bà"
    end
  end
end