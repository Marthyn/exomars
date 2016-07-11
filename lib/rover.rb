class Rover
  attr_reader :position, :heading

  RIGHT_TURNS = {
    'N' => 'E',
    'E' => 'S',
    'S' => 'W',
    'W' => 'N'
  }.freeze

  LEFT_TURNS = {
    'N' => 'W',
    'W' => 'S',
    'S' => 'E',
    'E' => 'N'
  }.freeze

  def initialize(position = [0, 0], heading = 'N')
    @position = position
    @heading = heading
  end

  def turn(direction)
    send("turn_#{direction.downcase}")
  rescue NoMethodError
    raise UnkownDirectionError.new("Direction #{direction} is not a valid direction")
  end

  def turn_r
    @heading = RIGHT_TURNS[@heading]
  end

  def turn_l
    @heading = LEFT_TURNS[@heading]
  end

  def move
    send("move_#{heading.downcase}")
  end

  def move_n
    position[1] += 1
  end
end

class UnkownDirectionError < RuntimeError; end
