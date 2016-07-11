require 'mission'

describe Mission do
  let(:sample_input) { "beep beep" }
  let(:real_input) {  }
  it "can initialize a mission with input" do
    expect(Mission.new(sample_input)).to be_a(Mission)
  end

  it "can initialize the planet with a bounded area based on given input" do
    Mission.new(

    )
  end
end
