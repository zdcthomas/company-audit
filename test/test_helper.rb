require 'date'
require 'simplecov'
require 'pry'
SimpleCov.start do
  add_filter '/test/'
end
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
