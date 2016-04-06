require 'logger'

module Xinge
  class Logging

    def initialize(log_target = STDOUT)
      @logger = Logger.new(log_target)
      @logger.level = Logger::INFO
      @logger
    end

    def logger
      @logger
    end


  end
end
