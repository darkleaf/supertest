module Supertest
    class TestStatistics
        attr_accessor :name, :time, :result, :asserts_count
        def initialize(name, time, result, asserts_count)
            @name = name
            @time = time
            @result = result
            @asserts_count = asserts_count
        end
    end
end
