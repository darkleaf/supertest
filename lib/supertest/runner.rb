module Supertest
    module Runner
        def self.run_tests
            at_exit do
                puts TestCase.descendants
            end
        end
    end
end
