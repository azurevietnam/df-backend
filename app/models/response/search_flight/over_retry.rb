class Response::SearchFlight::OverRetry < Response::SearchFlight::Response
  def success?
    false
  end
end