include LoadLogger

class BaseController
  def initialize(request)
    @request = request
    @response = Rack::Response.new
  end

  def not_found
    message = {'message': 'route not found'}.to_json
    log(:warn, message)
    send_response(message, Constants::CODE_404)
  end

  private

  def send_response(body, code = Constants::CODE_200)
    @response.body = StringIO.new(body)
    @response.status = code
    @response
  end
end
