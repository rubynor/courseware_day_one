require "./script.rb"
require "test/unit"

class TestTheScript < Test::Unit::TestCase

  def test_basic
    assert_equal 3, add(1,2)
    # etc...
  end

  def test_bonus
    assert_equal 3, add(1,"2")
    # etc... 
  end
  
end
