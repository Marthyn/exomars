class Rover
  attr_reader :position, :heading, :planet

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

  def initialize(position = [0, 0], heading = 'N', planet = Planet.new)
    @position = position
    @heading = heading
    @planet = planet
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
    new_position = send("move_#{heading.downcase}")
    raise InvalidMoveError if (new_position[0] < 0 || new_position[1] < 0)
    @position = new_position
  end

  def move_n
    [position[0], position[1] + 1]
  end

  def move_w
    [position[0] - 1, position[1]]
  end

  def move_s
    [position[0], position[1] - 1]
  end

  def move_e
    [position[0] + 1, position[1]]
  end
end

class UnkownDirectionError < RuntimeError; end
class InvalidMoveError < RuntimeError; end
