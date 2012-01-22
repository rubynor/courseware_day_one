require "./script.rb"
require "test/unit"

class TestTheScript < Test::Unit::TestCase

  def test_hive_init
    hive = Hive.new(1, 2, 3)
    assert_equal 6, hive.colony.count
    assert_equal 1, hive.colony.count { |bee| bee.class == Queen}
    assert_equal 2, hive.colony.count { |bee| bee.class == Drone}
    assert_equal 3, hive.colony.count { |bee| bee.class == Worker}
  end

  def test_count_types
    hive = Hive.new(1, 2, 3)
    assert_equal 6, hive.colony.count
    assert_equal 1, hive.count_queens
    assert_equal 2, hive.count_drones
    assert_equal 3, hive.count_workers
  end
  
  def test_count_inside_outside
    hive = Hive.new(1, 2, 3)
    assert_equal 6, hive.bees_inside
    assert_equal 0, hive.bees_outside
  end

  def test_exit
    hive = Hive.new(1, 2, 3)
    queen = hive.colony.find { |bee| bee.class == Queen}
    queen.leave_hive
    assert_equal 5, hive.bees_inside
    assert_equal 1, hive.bees_outside
  end
  
  def test_enter
    hive = Hive.new(1, 2, 3)
    queen = hive.colony.find { |bee| bee.class == Queen}
    queen.leave_hive
    assert_equal 5, hive.bees_inside
    assert_equal 1, hive.bees_outside
    queen.enter_hive
    assert_equal 6, hive.bees_inside
    assert_equal 0, hive.bees_outside
  end
  
  def test_defend
    hive = Hive.new(1, 2, 3)
    hive.defend
    assert_equal 3, hive.bees_inside
    assert_equal 3, hive.colony.count { |bee| bee.class == Worker && !bee.inside? }
  end

  def test_swarm
    hive = Hive.new(2, 30, 60)
    assert_equal 92, hive.colony.count
    hive.swarm
    assert_equal 46, hive.colony.count
    
  end

  def test_queen_reproduce
    hive = Hive.new(1, 0, 0)
    assert_equal 1, hive.colony.count
    queen = hive.colony.find { |bee| bee.class == Queen}
    queen.reproduce 50, hive, Worker
    assert_equal 51, hive.colony.count
    assert_equal 50, hive.count_workers
  end
  
end
