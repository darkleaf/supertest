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
        value ? success : failed
    end

    def assert_raise(error_class, &block)
        error_cathched = false
        begin
            block.call
        rescue error_class
            error_cathched = true
            return success
        ensure
            return failed unless error_cathched
        end
    end

    def run_test(test)
      clear_assert_counters

      time = Time.now
      result = send test
      time = Time.now - time

      TestStatistics.new test.to_s, time, result, @assert_success_count, @assert_failed_count
    end

    private

    def success
        add_assert_success_count
        :success
    end

    def failed
        add_assert_failed_count
        :failed
    end

    def add_assert_failed_count
        @assert_failed_count = @assert_failed_count + 1
    end

    def add_assert_success_count
        @assert_success_count = @assert_success_count + 1
    end

    def clear_assert_counters
        @assert_failed_count = 0
        @assert_success_count = 0
    end
  end
end
