module Supertest
  class TestCase
    class AssertFailedError < StandardError
    end

    extend ActiveSupport::DescendantsTracker
    class << self
      def call
        instance = new
        tests = instance.methods.grep /test_.*/

        tests.each do |t|
            time = Time.now
            result = :success
            begin
                instance.send t
            rescue AssertFailedError
                result = :failed
                p "Failed"
            ensure
                time = Time.now - time
            end
            instance.finished_tests << Test.new(time, result)
        end
        instance
      end
    end

    attr_accessor :finished_tests

    def initialize
        @finished_tests = []
    end

    def assert(value)
      raise AssertFailedError unless value
    end
  end
end
