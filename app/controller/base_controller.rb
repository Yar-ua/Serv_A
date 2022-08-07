include LoadLogger

class BaseController
  def initialize(request)
    @request = request
    @response = Rack::Response.new
  end

  # def not_found
  #   prepeare_response(:not_found, Constants::CODE_404)
  #   @response
  # end

  def test
    log(:info, "Test log message")
    message = {"task" => "test route", "message" => "response from test route was successful"}.to_json
    prepeare_response(message)

    # @response
  end

  private

    def prepeare_response(body, code = Constants::CODE_200)
      @response.body = StringIO.new(body)
      @response.status = code
      @response
    end
end
