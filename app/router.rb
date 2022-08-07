class Router
  def initialize(request)
    @request = request
    @controller = BaseController.new(request)
  end

  def route
    path = :test
    
    @controller.method(path).call
  end
end





# include LoadLogger
# def initialize(request)
#   @request = request
# end

# def send_request
#   # uri = URI('https://www.google.com/')
#   # response = Net::HTTP.get_response(uri)
#   # res =  {status: response.code, body: response.body, headers: response.to_hash}.to_json

#   log(:info, "Test log message")

#   res = {"task" => "test route", "message" => "response from test route was successful"}.to_json
#   # binding.pry

#   return res
# end