require 'rover'
require 'planet'
require 'heading'
require 'coordinates'

class Mission
  attr_reader :planet

  def initialize(lines)
    setup_planet(lines[0])
  end

  def parse_initial_coordinates(line)
    line.split(" ").map { |n| n.to_i }
  end

  def setup_planet(line)
    initial_coordinates = parse_initial_coordinates(line)
    @planet = Planet.new(initial_coordinates[0], initial_coordinates[1])
  end

  def setup_rovers

  end

  def run_rovers

  end

  def output

  end
end
