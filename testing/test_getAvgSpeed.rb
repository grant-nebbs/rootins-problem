# Testing for getAvgSpeed method

require_relative "../methods.rb"
require "test/unit"

class TestGetAvgSpeed < Test::Unit::TestCase
  def test_empty_strings
    assert_raise(RuntimeError){ getAvgSpeed("", "", 20.0) }
  end

  def test_zero_distance
    assert_equal([0, 10], getAvgSpeed("00:00", "10:00", 0))
  end
end
