# Testing for Driver class

require_relative "../methods.rb"
require "test/unit"

class TestDriver < Test::Unit::TestCase
  def test_initialize
    assert_equal("Dan", Driver.new("Dan").name)
  end
end
