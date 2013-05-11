module Supertest
  module Runner
    class << self
      def run_tests
        at_exit do
          TestCase.descendants.each{ |klass| klass.call }
        end
      end
    end
  end
end
