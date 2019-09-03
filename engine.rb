class Engine

  def initialize(obstacle_map)
    @obstacle_map = obstacle_map
  end

  def play()
    current_obstacle = @obstacle_map.opening_obstacle()
    last_obstacle = @obstacle_map.next_obstacle('success')

    while current_obstacle != last_obstacle
      next_obstacle_name = current_obstacle.start()
      current_obstacle = @obstacle_map.next_obstacle(next_obstacle_name)
    end

    #be sure to print out the last obstacle
    current_obstacle.start()

  end
end


class Map
@@obstacles = {
  'nori' => Nori.new(),
  'foyer' => Foyer.new(),
  'teapot' => Teapot.new(),
  'owner' => Owner.new(),
  'sushi' => Sushi.new(),
  'success' => Success.new(),
  'fail' => Fail.new()
}

  def initialize(start_obstacle)
    @start_obstacle = start_obstacle
  end

  def next_obstacle(obstacle_name)
    @@obstacles[obstacle_name]
  end

  def opening_obstacle()
     next_obstacle(@start_obstacle)
  end
end
