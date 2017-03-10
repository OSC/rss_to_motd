$LOAD_PATH.unshift File.expand_path(File.dirname(File.dirname(__FILE__)))

ENV['RACK_ENV'] = 'test'
# uncomment if using with sinatra
# require 'environment'
require 'minitest/autorun'
