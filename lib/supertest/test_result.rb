module Supertest
  class TestResult
    attr_accessor :tests_count, :assert_success_count, :assert_failed_count

    def initialize
      @tests_count = 0
      @assert_success_count = 0
      @assert_failed_count = 0
    end

    def inc_tests_count
      @tests_count = @tests_count + 1
    end

    def inc_assert_success_count(count = 1)
      @assert_success_count = @assert_success_count + count
    end

    def inc_assert_failed_count(count = 1)
        @assert_failed_count = @assert_failed_count + count
    end


    def add_test_statistic(statistics)
      inc_tests_count
      inc_assert_success_count statistics.assert_success_count
      inc_assert_failed_count statistics.assert_failed_count

      puts "#{statistics.name} #{statistics.result} #{statistics.time}"
    end

    def results
        puts "All asserts: #{assert_success_count + assert_failed_count}"
      puts "Assert success count: #{assert_success_count}"
      puts "Assert failed count: #{assert_failed_count}"
      puts "Tests count: #{tests_count}"
    end
  end
end
