module Supertest
  module Runner
    class << self
      def run_tests
        at_exit do
          tests = TestCase.descendants.map{ |klass| klass.call }
          show_stat(tests)
        end
      end

      def show_stat(tests)
          test_count = 0
          assert_success = 0
          assert_failed = 0
          tests.each do |test|
              test.finished_tests.each do |t|
                  test_count += 1
                  assert_success += 1 if t.result == :success
                  assert_failed += 1 if t.result == :failed
                  p "Test: name= #{t.name}, time: #{t.time}, status: #{t.result}"
              end
          end

          p "Test all: #{test_count}"
      end
    end
  end
end
