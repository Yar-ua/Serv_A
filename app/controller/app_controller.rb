class AppController < BaseController
  def test
    message = { task: 'test route', message: 'response from test route was successful', params: filter_params }.to_json
    log(:info, message)
    send_response(message)
  end

  def ping
    message = { task: 'ping message', message: 'ping message', params: filter_params }.to_json
    log(:info, message)
    send_response(message)
  end

  private

  def filter_params
    @request.params.empty? ? '' : @request.params
  end
end
