module Supertest
  class TestCase
    extend ActiveSupport::DescendantsTracker

    class AssertFailedError < StandardError
    end

    class << self
      def call()
        test_controller = TestController.new

        instance = new
        tests = instance.methods.grep /test_.*/

        tests.each do |t|
          test_result = instance.run_test t
          test_controller.notify test_result
        end
      end
    end

    def assert(value)
      raise AssertFailedError unless value
    end

    def run_test(test)
      time = Time.now
      result = :success
      begin
        send test
      rescue AssertFailedError
        result = :failed
      ensure
        time = Time.now - time
      end

      TestStatistics.new test.to_s, time, result
    end
  end
end
