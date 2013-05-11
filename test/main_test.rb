require 'test_helper'

class MainTest < Supertest::TestCase
  def test_assert_true
    assert true
  end

  def test_assert_false
    assert false
  end

  def test_assert_raise
      assert_raise StandardError do
          raise "Error"
      end
  end

  def test_assert_other_raise
      assert_raise StandardError do

      end
  end
end
