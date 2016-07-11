require 'mission'

describe Planet do
  it "has a maximum bounds" do
    planet = Planet.new(5, 5)
    expect(planet.bounds.position).to eq([5, 5])
  end
end
