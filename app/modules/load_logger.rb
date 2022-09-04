module LoadLogger
  def log(level, message, code = Constants::CODE_200)
    logger = MyLogger.instance
    logger.log(level, server_log(code), message)
  end

  def server_log(code)
    request = @request

    [
      request.ip || '-',
      request.get_header('REMOTE_USER') || '-',
      Time.now.strftime('%d/%b/%Y:%H:%M:%S %z'),
      request.request_method,
      request.script_name,
      request.path_info,
      request.query_string.empty? ? '' : "?#{request.query_string}",
      request.env['SERVER_PROTOCOL'],
      code
    ].join(' ')
  end
end
