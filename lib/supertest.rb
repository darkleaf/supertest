require 'active_support/descendants_tracker'
require 'active_support/dependencies/autoload'

module Supertest
  extend ActiveSupport::Autoload

  autoload :Version
  autoload :TestCase
  autoload :Runner
  autoload :Test

  def self.run_tests
    Runner.run_tests
  end
end
