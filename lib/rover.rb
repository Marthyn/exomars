class Rover
  attr_reader :position, :heading, :planet

  def initialize(position = [0, 0], heading = 'N', planet = Planet.new)
    @coordinates = Coordinates.new(position[0], position[1])
    @heading = Heading.new(heading)
    @planet = planet
  end

  def position
    @coordinates.position
  end

  def instruct(method)
    case method
    when "M"
      move
    when "L"
      turn(method)
    when "R"
      turn(method)
    else
      InvalidInstructionError.new("#{method} is an invalid instruction")
    end
  end

  def turn(direction)
    turn_method = "turn_#{direction.downcase}"
    raise UnkownDirectionError.new("Direction #{direction} is not a valid direction") unless heading.respond_to?(turn_method)
    heading.send(turn_method)
  end

  def move
    new_position = @coordinates.send("move_#{heading.to_s.downcase}")
    raise OutOfBoundsError.new("Can't move outside of #{planet.bounds}, current position is #{position}") if planet.out_of_bounds?(new_position)
    @coordinates = new_position
  end
end

class InvalidInstructionError < RuntimeError; end
