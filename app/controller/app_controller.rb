class AppController < BaseController
  def test
    message = { task: 'test route', message: 'response from test route was successful' }.to_json
    log(:info, message)
    send_response(message)
  end

  def ping
    params = @request.params
    message = { task: 'ping message', message: 'ping message', params: params.to_s }.to_json
    log(:info, message)
    send_response(message)
  end
end
