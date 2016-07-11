require 'mission'

describe Planet do
  it "has a maximum bounds" do
    expect(Planet.new(5, 5).bounds).to eq([5, 5])
  end
end
