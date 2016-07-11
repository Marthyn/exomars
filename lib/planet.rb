class Planet
  attr_reader :max_x, :max_y

  def initialize(x = 5, y = 5)
    @max_x = x
    @max_y = y
  end

  def bounds
    @bounds ||= Coordinates.new(max_x, max_y)
  end

  def out_of_bounds?(coordinates)
    coordinates.x < 0 || coordinates.y < 0 || coordinates.x > bounds.x || coordinates.y > bounds.y
  end
end

class OutOfBoundsError < RuntimeError; end
