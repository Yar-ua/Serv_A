include LoadLogger

class BaseController
  def initialize(request)
    @request = request
    @response = Rack::Response.new
  end

  def not_found
    message = { message: 'route not found' }.to_json
    code = Constants::CODE_404
    log(:warn, message, code)
    send_response(message, code)
  end

  private

  def send_response(body, code = Constants::CODE_200)
    @response.body = [body]
    @response.status = code
    @response
  end
end
