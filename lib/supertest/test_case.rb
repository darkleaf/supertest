module Supertest
  class TestCase
    extend ActiveSupport::DescendantsTracker

    class AssertFailedError < StandardError
    end

    class << self
      def call()
        test_result = TestResult.new

        instance = new
        tests = instance.methods.grep /test_.*/

        tests.each do |t|
          stat = instance.run_test t
          test_result.add_test_statistic stat
        end

        test_result.results
      end
    end

    def assert(value)
      raise AssertFailedError unless value
      @asserts_count = @asserts_count + 1
    end

    def assert_raise(error_class, &block)
        error_cathched = false
        begin
            block.call
        rescue error_class
            error_cathched = true
            @asserts_count = @asserts_count + 1
        ensure
            raise AssertFailedError unless error_cathched
        end
    end

    def run_test(test)
      time = Time.now
      result = :success
      @asserts_count = 0

      begin
        send test
      rescue AssertFailedError
        result = :failed
      ensure
        time = Time.now - time
      end

      TestStatistics.new test.to_s, time, result, @asserts_count
    end
  end
end
