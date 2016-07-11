class Rover
  attr_reader :position, :heading

  def initialize(position = [0, 0], heading = 'N')
    @position = position
    @heading = heading
  end

  def move
    send("move_#{heading.downcase}")
  end

  def move_n
    position[1] += 1
  end
end
