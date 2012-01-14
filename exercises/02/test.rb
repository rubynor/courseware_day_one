require "./script.rb"
require "test/unit"

class TestTheScript < Test::Unit::TestCase
  
  def test_basic
    assert_equal "Hello, Hello", repeat("Hello",2)
  end
  
  def test_bonus
     # ...
  end
  
end
