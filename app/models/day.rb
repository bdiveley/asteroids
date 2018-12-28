class Day
  attr_reader :asteroids, :day

  def initialize(day)
    @day = day
    @asteroids = []
  end

  def add_asteroids(data)
    data.each do |asteroid|
      obj = Asteroid.new(asteroid)
      @asteroids << obj
    end
  end

  def count_dangerous_asteroids
    @asteroids.count do |asteroid|
      asteroid.is_potentially_hazardous_asteroid == true
    end
  end

  def worst_asteroids
    @asteroids.find_all do |asteroid|
      asteroid.is_potentially_hazardous_asteroid == true
    end
  end
end
