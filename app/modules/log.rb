require 'logger'

module Log
  @logger ||= Logger.new(STDOUT)
  @log_file ||= Logger.new(File.open('./logs/development.log', File::WRONLY | File::APPEND | File::CREAT))

  def debug(message)
    @logger.debug(message.colorize(:blue))
    @log_file.debug(message)
  end

  def info(message)
    @logger.info(message.colorize(:green))
    @log_file.info(message)
  end

  def warn(message)
    @logger.warn(message.colorize(:yellow))
    @log_file.warn(message)
  end

  def error(message)
    @logger.error(message.colorize(:red))
    @log_file.error(message)
  end

  def fatal(message)
    error(message)
    @log_file.fatal(message)
  end

  def unknown(message)
    error(message)
    @log_file.unknown(message)
  end
end