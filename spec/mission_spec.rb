require 'mission'

describe Mission do
  let(:sample_input) { "beep beep" }
  let(:lines) {
    [
      "5 5",
      "1 2 N",
      "LMLMLMLMM",
      "3 3 E",
      "MMRMMRMRRM"
    ]
  }
  it "can initialize a mission with input" do
    expect(Mission.new(sample_input)).to be_a(Mission)
  end

  it "can initialize the planet with a bounded area based on given input" do
    mission = Mission.new(lines)
    expect(mission.planet.bounds.position).to eq([5, 5])
  end
end
