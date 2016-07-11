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

  let(:exomars) { Mission.new(lines) }

  it "can initialize a mission with input" do
    expect(Mission.new(sample_input)).to be_a(Mission)
  end

  it "can initialize the planet with a bounded area based on given input" do
    expect(exomars.planet.bounds.position).to eq([5, 5])
  end

  it "sets up the rovers with initial positions" do
    expect(exomars.rovers[0].position).to eq([1, 2])
    expect(exomars.rovers[1].position).to eq([3, 3])
    expect(exomars.rovers[0].heading.to_s).to eq("N")
    expect(exomars.rovers[1].heading.to_s).to eq("E")
  end

  it "returns the expected output" do
    exomars.start
    expect(exomars.output[0]).to eq("1 3 N")
    expect(exomars.output[1]).to eq("5 1 E")
  end
end
