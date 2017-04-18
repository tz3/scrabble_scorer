# frozen_string_literal: true

require 'rack'
require 'minitest/autorun'
require 'json'
require 'coveralls'
ENV['RACK_ENV'] = 'test'
Coveralls.wear!