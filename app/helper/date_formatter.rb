class DateFormatter
  def self.format_date_time(time)
    time.strftime("%H:%M %d/%m/%Y")
  end
  
  def self.format_date(time)
    time.strftime("%d/%m/%Y")
  end
  
  def self.format_time(time)
    time.strftime("%H:%M")
  end
  
  def self.format_with_user_defined(time, format_type)
    time.strftime(format_type)
  end
end