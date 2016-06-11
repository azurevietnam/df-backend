class Response::Response
  attr_reader :data, :message, :error_type
  def initialize(args)
    args.each do |k,v|
      instance_variable_set("@#{k}",v) unless v.nil?
    end
  end

  def success?
    raise NotImplementedError
  end
end