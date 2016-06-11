class Response::Response
  attr_reader :data, :message
  def initialize(data, message)
    @data = data
    @message = message
  end

  def success?
    raise NotImplementedError
  end
end