module Supertest
    class Test
        attr_reader :time, :result
        def initialize(time, result)
            @time = time
            @result = result
        end
    end
end
