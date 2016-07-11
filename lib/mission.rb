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
    run_rovers
  end

  def parse_initial_coordinates(line)
    line.split(" ").map { |n| n.to_i }
  end

  def setup_planet
    initial_coordinates = parse_initial_coordinates(lines[0])
    @planet = Planet.new(initial_coordinates[0], initial_coordinates[1])
  end

  def setup_rovers
    @rovers = []
    rover_coordinates = lines[1].split(" ")
    @rovers << Rover.new([rover_coordinates[0].to_i, rover_coordinates[1].to_i], rover_coordinates[2])
    rover_coordinates = lines[3].split(" ")
    @rovers << Rover.new([rover_coordinates[0].to_i, rover_coordinates[1].to_i], rover_coordinates[2])
  end

  def run_rovers
    lines[2].each_char do |instruction|
      @rovers.first.instruct(instruction)
    end

    lines[4].each_char do |instruction|
      @rovers.last.instruct(instruction)
    end
  end

  def output
    output = []
    @rovers.each do |rover|
      output << "#{rover.position[0]} #{rover.position[1]} #{rover.heading.to_s}"
    end
    output
  end

  def parse_rover_coordinates(line)
    line.split(" ")
  end
end
