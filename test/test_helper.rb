require 'simplecov'
require 'json'
SimpleCov.start

require 'bundler'
Bundler.require(:default, :test)

$LOAD_PATH << File.join(File.dirname(__FILE__), '/../lib')

require 'intergalactic_money_calculator'

require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new, Minitest::Reporters::SpecReporter.new(color: true)]
