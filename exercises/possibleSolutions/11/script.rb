
class Bee
  def initialize
    @inside = true
  end
  
  def enter_hive
    @inside = true
  end

  def leave_hive
    @inside = false
  end

  def inside?
    @inside
  end
end

class Queen < Bee
  def reproduce(n, home_hive, type)
    n.times do
      home_hive.colony << type.new
    end
  end
end

class Drone < Bee
  
end


class Worker < Bee
  
end




class Hive
  attr :colony
  
  def initialize x, y, z
    @colony = []
    x.times do
      @colony << Queen.new 
    end
    y.times do
      @colony << Drone.new 
    end
    z.times do
      @colony << Worker.new 
    end
  end


  def count_type klass
    @colony.count { |bee| bee.class == klass}
  end
  
  def count_queens
    count_type Queen
  end

  def count_drones
    count_type Drone
  end

  def count_workers
    count_type Worker
  end

  def bees_inside
    @colony.count { |bee| bee.inside?}
  end

  def bees_outside
    @colony.count { |bee| !bee.inside?}
  end

  def defend
    workers = @colony.select { |bee| bee.class == Worker }
    workers.each { |worker| worker.leave_hive }
  end
  
  def swarm
    leaving_bee = colony.find { |bee| bee.class == Queen }
    colony.delete_if { |bee| bee == leaving_bee}
    
    (count_workers/2).times do
      leaving_bee = colony.find { |bee| bee.class == Worker }
      colony.delete_if { |bee| bee == leaving_bee}
    end
    
    (count_drones/2).times do
      leaving_bee = colony.find { |bee| bee.class == Drone }
      colony.delete_if { |bee| bee == leaving_bee}
    end
  end
  
end
