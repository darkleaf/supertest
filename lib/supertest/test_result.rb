module Supertest
  class TestResult
    attr_accessor :tests_count, :asserts_count

    def initialize
      @tests_count = 0
      @asserts_count = 0
    end

    def inc_tests_count
      @tests_count = @tests_count + 1
    end

    def inc_asserts_count(count = 1)
      @asserts_count = @asserts_count + count
    end

    def add_test_statistic(statistics)
      inc_tests_count
      inc_asserts_count statistics.asserts_count

      puts "#{statistics.name} #{statistics.result} #{statistics.time}"
    end

    def results
      puts "Asserts count: #{asserts_count}"
      puts "Tests count: #{tests_count}"
    end
  end
end
