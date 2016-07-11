require 'mission'

describe Rover do
  let(:default_schiaparelli) { Rover.new }

  it "initializes with a planet" do
    expect(default_schiaparelli.planet).to be_a(Planet)
  end

  it "has a default position" do
    expect(default_schiaparelli.position).to eq([0, 0])
  end

  it "has a default heading" do
    expect(default_schiaparelli.heading.to_s).to eq('N')
  end

  it "can move north and return the correct position" do
    default_schiaparelli.move
    expect(default_schiaparelli.position).to eq([0, 1])
  end

  it "can move west and return the correct position" do
    west_schiaparelli = Rover.new([2, 2], 'W')
    west_schiaparelli.move
    expect(west_schiaparelli.position).to eq([1, 2])
  end

  it "can move east and return the correct position" do
    east_schiaparelli = Rover.new([0, 0], 'E')
    east_schiaparelli.move
    expect(east_schiaparelli.position).to eq([1, 0])
  end

  it "can move south and return the correct position" do
    south_schiaparelli = Rover.new([1, 1], 'S')
    south_schiaparelli.move
    expect(south_schiaparelli.position).to eq([1, 0])
  end

  it "can't move west when x = 0" do
    default_schiaparelli.turn('L')
    expect{ default_schiaparelli.move }.to raise_error(OutOfBoundsError)
  end

  it "can't move out of the maximum bounds of the planet" do
    schiaparelli = Rover.new([0, 0], 'E', Planet.new(1, 1))
    schiaparelli.move
    expect(schiaparelli.position).to eq [1, 0]
    expect{ schiaparelli.move }.to raise_error(OutOfBoundsError)
  end

  it "has the correct heading after turning right" do
    default_schiaparelli.turn('R')
    expect(default_schiaparelli.heading.to_s).to eq('E')
  end

  it "turns to S when heading is E" do
    schiaparelli = Rover.new([0, 0], 'E', Planet.new(1, 1))
    schiaparelli.turn("R")
    expect(schiaparelli.heading.to_s).to eq("S")
  end

  it "has the correct heading after turning left" do
    default_schiaparelli.turn('L')
    expect(default_schiaparelli.heading.to_s).to eq('W')
  end

  it "has the same heading after turning 4 times" do
    4.times do
      default_schiaparelli.turn('L')
    end
    expect(default_schiaparelli.heading.to_s).to eq('N')
  end

  it "can instruct to turn based on a character" do
    expect(default_schiaparelli).to receive(:turn).with('L')
    default_schiaparelli.instruct('L')
  end

  it "can instruct to turn based on a character" do
    expect(default_schiaparelli).to receive(:turn).with('R')
    default_schiaparelli.instruct('R')
  end


  it "can instruct to move based on the character M" do
    expect(default_schiaparelli).to receive(:move)
    default_schiaparelli.instruct('M')
  end

  it "cannot turn with an unknown direction" do
    expect{ default_schiaparelli.turn('Y') }.to raise_error(UnkownDirectionError)
  end
end
