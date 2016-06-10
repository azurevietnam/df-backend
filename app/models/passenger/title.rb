class Passenger::Title
  def self.show(gender, category)
    if gender == Passenger.GENDERs[:MALE]
      if Passenger::Category.is_adult(category)
        return "Ông"
      elsif Passenger::Category.is_child(category)
        return "Em trai"
      elsif Passenger::Category.is_infant(category)
        return "Bé trai"
      else ""
      end
    else
      if Passenger::Category.is_adult(category)
        return "Bà"
      elsif Passenger::Category.is_child(category)
        return "Em gái"
      elsif Passenger::Category.is_infant(category)
        return "Bé gái"
      else ""
      end
    end
  end
end