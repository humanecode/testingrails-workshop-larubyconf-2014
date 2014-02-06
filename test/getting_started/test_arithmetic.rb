require "minitest/autorun"

class TestArithmetic < MiniTest::Unit::TestCase
  def test_one_plus_one_is_two
    assert_equal 2, 1 + 1
  end
end
