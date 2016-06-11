class Response::Error < Response::Response
  def success?
    false
  end
end