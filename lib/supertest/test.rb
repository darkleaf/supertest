module Supertest
    class Test
        attr_accessor :name, :time, :result
        def initialize(name, time, result)
            @name = name
            @time = time
            @result = result
        end
    end
end
