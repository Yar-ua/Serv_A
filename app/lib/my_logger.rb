class MyLogger
  include Singleton

  def initialize
    @logger ||= Logger.new(STDOUT)
    @log_file ||= Logger.new(File.open('./logs/development.log', File::WRONLY | File::APPEND | File::CREAT))
  end

  def log(level, message)
    console_log(level, message)
    write_log(level, message)
  end
  
  private
  
  def console_log(level, message)
    @logger.method(level).call(message.colorize(Constants::COLOR[level]))
  end

  def write_log(level, message)
    @log_file.method(level).call(message)
  end
end