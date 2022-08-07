require 'rack'
require 'delegate'
require 'stringio'
require 'json'
require 'pry'
require 'uri'
require 'net/http'
require 'singleton'
require 'colorize'
require 'logger'
require 'dotenv/load'

require_relative './config/config'
require_relative './modules/constants'
require_relative './lib/my_logger'
require_relative './modules/load_logger'
require_relative './middleware/header_middleware'
require_relative './middleware/auth_middleware'
require_relative './controller/base_controller'
require_relative './controller/app_controller'
require_relative './router'

require_relative './app'
