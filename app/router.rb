class Router
  def initialize(request)
    @request = request
    @controller = ServiceController.new(request)
  end

  def route
    path = Config::URLS.key(@request.path)
    return @controller.not_found unless path
    
    @controller.method(path).call
  end
end

# def send_request
#   # uri = URI('https://www.google.com/')
#   # response = Net::HTTP.get_response(uri)
#   # res =  {status: response.code, body: response.body, headers: response.to_hash}.to_json
#   log(:info, "Test log message")
#   return res
# end