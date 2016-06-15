class Response::SearchFlight::Response
  attr_reader :data, :message

  def success?
    raise NotImplementedError
  end
end