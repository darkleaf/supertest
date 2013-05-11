module Supertest
    class TestStatistics
        attr_accessor :name, :time, :result, :assert_success_count, :assert_failed_count
        def initialize(name, time, result, assert_success_count, assert_failed_count)
            @name = name
            @time = time
            @result = result
            @assert_success_count = assert_success_count
            @assert_failed_count = assert_failed_count
        end
    end
end
