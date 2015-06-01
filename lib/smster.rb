require 'rest_client'
require 'smster/configuration'
require 'smster/sms'
require 'smster/sms/smsru'

module Smster
  attr_accessor :configuration

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end

require './config/initializers/smster'
