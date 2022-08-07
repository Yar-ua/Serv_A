module LoadLogger
  
  def log(level, message)
    logger = MyLogger.instance
    logger.log(level, message)
  end
end