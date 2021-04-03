# Testing for timeToHours method

require_relative "../methods.rb"
require "test/unit"

class TestTimeToHours < Test::Unit::TestCase

  def test_zero_time
    assert_equal(0, timeToHours("00:00"))
  end

  def test_empty_string
    assert_raise(RuntimeError){ timeToHours("") }
  end

  def test_wrong_format
    assert_raise(RuntimeError){ timeToHours("100:100") }
  end
end
