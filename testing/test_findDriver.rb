# Testing for findDriver method

require_relative "../methods.rb"
require "test/unit"

class TestFindDriver < Test::Unit::TestCase

  def test_name_does_not_exist
    assert_raise(RuntimeError){ findDriver("Dan", [Driver.new("Garrett"), Driver.new("Susan")]) }
  end

  def test_name_exists
    assert_equal("Dan", findDriver("Dan",[Driver.new("Colton"), Driver.new("Dan")]).name)
  end
  
  def test_empty_string
    assert_raise(RuntimeError){ findDriver("", [Driver.new("Garrett"), Driver.new("Susan")]) }
  end
end
