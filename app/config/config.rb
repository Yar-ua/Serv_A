module Config
  SERVICE_NAME = "Service A"

  URLS = {
    test: '/test',
    ping: '/ping'
  }.freeze

  AUTH_URLS = URLS.slice(:ping).values
end
