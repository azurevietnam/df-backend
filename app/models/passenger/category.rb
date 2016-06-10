class Passenger::Category
  def self.name(category)
    if self.is_adult(category)
      "Người lớn"
    elsif self.is_child(category)
      "Trẻ em"
    elsif self.is_infant(category)
      "Em bé"
    else
      ""
    end
  end
  
  def self.is_adult(category)
    return category == Passenger.CATEGORies[:ADULT]
  end
  
  def self.is_child(category)
    return category == Passenger.CATEGORies[:CHILD]
  end
  
  def self.is_infant(category)
    return category == Passenger.CATEGORies[:INFANT]
  end
  
end