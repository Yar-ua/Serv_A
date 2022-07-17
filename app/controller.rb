include Log

class Controller
  def initialize(request)
    @request = request
  end

  def send_request
    uri = URI('https://www.google.com/')
    response = Net::HTTP.get_response(uri)
    res =  {status: response.code, body: response.body, headers: response.to_hash}.to_json

    Log.info("Test log message")
    Log.fatal("Test fatal log message")

    return res
  end
end