module Supertest
  module Runner
    class << self
      def run_tests
        at_exit do
          tests = TestCase.descendants.map{ |klass| klass.call }
          p tests
        end
      end
    end
  end
end
