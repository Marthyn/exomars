require 'mission'

describe Mission do
  it "can initialize a mission with input" do
    expect(Mission.new(sample_input)).to be_a?(Mission)
  end
end
