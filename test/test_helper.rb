$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ayanami'

require 'minitest/autorun'

require 'simplecov'
SimpleCov.start

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov
