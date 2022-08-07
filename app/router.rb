class Router
  def initialize(request)
    @request = request
    @controller = AppController.new(request)
  end

  def route
    path = Config::URLS.key(@request.path)
    return @controller.not_found unless path

    @controller.method(path).call
  end
end
