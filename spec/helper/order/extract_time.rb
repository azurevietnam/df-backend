class Helper::Order::ExtractTime
  def self.call(time)
    time.strftime("%H:%M")
  end
end