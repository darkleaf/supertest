require 'test_helper'

class MainTest < Supertest::TestCase
  def test_assert
    assert true
  end
end

MainTest.call
