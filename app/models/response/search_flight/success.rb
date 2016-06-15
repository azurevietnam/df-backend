class Response::SearchFlight::Success < Response::SearchFlight::Response
  def success?
    true
  end
end