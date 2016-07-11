require 'mission'

describe Rover do
  let(:default_schiaparelli) { Rover.new }

  it "has a default position" do
    expect(default_schiaparelli.position).to eq([0, 0])
  end

  it "has a default heading" do
    expect(default_schiaparelli.heading).to eq('N')
  end

  it "can move north and return the correct position" do
    default_schiaparelli.move
    expect(default_schiaparelli.position).to eq([0, 1])
  end

  it "can't move west when x = 0" do

  end

  it "has the correct heading after turning right" do
    default_schiaparelli.turn('R')
    expect(default_schiaparelli.heading).to eq('E')
  end

  it "has the correct heading after turning left" do
    default_schiaparelli.turn('L')
    expect(default_schiaparelli.heading).to eq('W')
  end

  it "cannot turn with an unknown direction" do
    expect{ default_schiaparelli.turn('Y') }.to raise_error(UnkownDirectionError)
  end

  xit "has the correct heading after turning left" do
    schiaparelli.turn('R')
    expect(schiaparelli.heading).to eq('W')
  end
end
