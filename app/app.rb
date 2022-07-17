class App
  def initialize(env)
    @request = Rack::Request.new(env)
  end
  
  def self.call(env)
    @req = Controller.new(@request)
    @message = @req.send_request
    new(env).response(@message.to_json).finish
  end
  
  def response(message)
    Rack::Response.new(message, 255)
  end
end