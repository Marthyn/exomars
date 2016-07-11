require 'mission'

describe Rover do
  let(:schiaparelli) { Rover.new }

  it "has a default position" do
    expect(schiaparelli.position).to_eq([0, 0])
  end

  it "can move around Mars and return a new position" do
    schiaparelli.move
    expect(schiaparelli.position).to eq([0, 1])
  end

  it "has a default heading" do
    expect(schiaparelli.heading).to eq('N')
  end

  it "has the correct heading after turning right" do
    schiaparelli.turn('R')
    expect(schiaparelli.heading).to eq('E')
  end

  it "has the correct heading after turning left" do
    schiaparelli.turn('R')
    expect(schiaparelli.heading).to eq('W')
  end
end
