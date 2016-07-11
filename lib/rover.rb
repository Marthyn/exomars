class Rover
  attr_reader :position, :heading

  def initialize(position = [0, 0], heading = 'N')
    @position = position
    @heading = heading
  end

  def turn(direction)
    send("turn_#{direction.downcase}")
  rescue NoMethodException

  end

  def turn_r

  end

  def turn_l

  end

  def move
    send("move_#{heading.downcase}")
  end

  def move_n
    position[1] += 1
  end
end
