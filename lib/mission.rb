require 'rover'
require 'planet'
require 'heading'
require 'coordinates'

class Mission
  attr_reader :planet, :rovers, :lines

  def initialize(lines)
    @lines = lines
    setup_planet
    setup_rovers
  end

  def start
    lines[2].each_char do |instruction|
      @rovers.first.instruct(instruction)
    end

    lines[4].each_char do |instruction|
      @rovers.last.instruct(instruction)
    end
  end

  def setup_planet
    initial_coordinates = lines[0].split(" ").map { |n| n.to_i }
    @planet = Planet.new(initial_coordinates[0], initial_coordinates[1])
  end

  def setup_rovers
    @rovers = [1, 3].map do |i|
      coordinates = lines[i].split(" ")
      Rover.new([coordinates[0].to_i, coordinates[1].to_i], coordinates[2])
    end
  end

  def output
    @rovers.map do |rover|
      "#{rover.position[0]} #{rover.position[1]} #{rover.heading.to_s}"
    end
  end
end
