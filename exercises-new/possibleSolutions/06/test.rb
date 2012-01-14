require "./script.rb"
require "test/unit"

class TestTheScript < Test::Unit::TestCase

  def test_strict_adder
    assert_equal 4, add_strict(2,2)
    assert_raise TypeError do
      add_strict(2, "2")
    end
  end
  
end
