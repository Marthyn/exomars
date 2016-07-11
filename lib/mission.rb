require 'rover'
require 'planet'
require 'heading'
require 'coordinates'

class Mission
  attr_reader :planet, :rovers

  def initialize(lines)
    setup_planet(lines)
    setup_rovers(lines)
    run_rovers(lines)
  end

  def parse_initial_coordinates(line)
    line.split(" ").map { |n| n.to_i }
  end

  def setup_planet(lines)
    initial_coordinates = parse_initial_coordinates(lines[0])
    @planet = Planet.new(initial_coordinates[0], initial_coordinates[1])
  end

  def setup_rovers(lines)
    @rovers = []
    rover_coordinates = lines[1].split(" ")
    @rovers << Rover.new([rover_coordinates[0].to_i, rover_coordinates[1].to_i], rover_coordinates[2])
    rover_coordinates = lines[3].split(" ")
    @rovers << Rover.new([rover_coordinates[0].to_i, rover_coordinates[1].to_i], rover_coordinates[2])
  end

  def run_rovers(lines)
    lines[4].each_char do |instruction|
      @rovers.first.instruct(instruction)
    end
    lines[5].each_char do |instruction|
      @rovers.last.instruct(instruction)
    end
  end

  def output
    @rovers.each do |rover|
      puts "#{rover.position[0]} #{rover.position[1]} #{rover.heading.to_s}"
      puts ""
    end
  end

  def parse_rover_coordinates(line)
    line.split(" ")
  end
end
