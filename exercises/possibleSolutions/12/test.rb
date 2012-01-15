require "./script.rb"
require "test/unit"

class TestTheScript < Test::Unit::TestCase
 
  def test_tree_structure
    parent = RubyKurs::Tree.new "parent"
    child = RubyKurs::Tree.new "child1"
    second_child = RubyKurs::Tree.new "child2"
    parent.add child
    parent.add second_child
    assert_equal(child, parent.children[0])
    assert_equal(second_child, parent.children[1])
  end

  def single_parent_two_children
    parent = RubyKurs::Tree.new "parent"
    child = RubyKurs::Tree.new "child1"
    second_child = RubyKurs::Tree.new "child2"
    parent.add child
    parent.add second_child
    return parent
  end
  
  def test_traverse_down
    tree = single_parent_two_children
    node_count = 0
    tree.traverse_down {|node| node_count += 1}
    assert_equal 3, node_count
  end

  def test_enumerable_mixin
    tree = single_parent_two_children    
    assert_equal 3, tree.count
    assert_equal ["parent", "child1", "child2"], tree.map { |node| node.node_value }
    parents = tree.find_all { |node| node.node_value == "parent" }
    parents.count == 1
    assert tree.any? { |node| node.node_value == "child1" }
    refute tree.any? { |node| node.node_value == "child3" }
  end

  def test_tostring
    expected =
<<AS_STRING
parent
  child1
  child2
AS_STRING
    actual = single_parent_two_children.to_s
    assert_equal expected, actual
  end
  
  
end
