module Supertest
  class TestCase
    class << self
      def call
        instance = new
        tests = instance.methods.grep /test.*/
        tests.each{ |t| instance.send t }
      end
    end

    def assert(value)
      puts value ? 'Success' : 'Failed'
    end
  end
end