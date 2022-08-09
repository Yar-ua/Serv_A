module Config
  SERVICE_NAME = 'Service A'.freeze
  API_TOKEN = ENV['API_TOKEN'].freeze
  ENVIRONMENT = ENV['ENVIRONMENT'].freeze

  URLS = {
    test: '/test',
    ping: '/ping'
  }.freeze

  AUTH_URLS = URLS.slice(:ping).values
end
