require 'active_support/descendants_tracker'
require 'active_support/dependencies/autoload'

module Supertest
  extend ActiveSupport::Autoload

  autoload :Version
  autoload :TestCase
  autoload :TestResult
  autoload :TestStatistics

  at_exit {TestCase.descendants.each{ |klass| klass.call }}
end
