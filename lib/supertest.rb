require "supertest/version"

module Supertest
  autoload :TestCase, 'supertest/test_case.rb'
  autoload :Runner, 'supertest/runner.rb'

  def self.run_tests
    Runner.run_tests
  end
end
