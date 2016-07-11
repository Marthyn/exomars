class Planet
  attr_reader :bounds

  def initialize(x = 1, y = 1)
    @max_x = x
    @max_y = y
  end

  def bounds
    @bounds ||= [@max_x, @max_y]
  end
end
