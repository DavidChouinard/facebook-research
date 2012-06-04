class ResponseLogger < Logger
  def initialize(model)
    @model = model
  end

  def add(message = nil)
    @model.create({"content" => message.to_s})
  end
end

RESPONSE_LOGGER = ResponseLogger.new(ResponseLog)
