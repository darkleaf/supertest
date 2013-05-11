module Supertest
  class TestController
    def notify(statistics)
      puts "#{statistics.result} #{statistics.time}"
    end
  end
end