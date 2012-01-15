require "./script.rb"
require "test/unit"

class TestTheScript < Test::Unit::TestCase
 
  def test_tree_structure
    parent = RubyKurs::Tree.new "1"
    child = RubyKurs::Tree.new "2"
    second_child = RubyKurs::Tree.new "3"
    parent.add child
    parent.add second_child
    assert_equal(child, parent.children[0])
    assert_equal(second_child, parent.children[1])
  end

  # ...
   
end
