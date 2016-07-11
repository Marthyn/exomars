class Coordinates
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def position
    [x, y]
  end

  def move_n
    self.class.new(x, y + 1)
  end

  def move_w
    self.class.new(x - 1, y)
  end

  def move_s
    self.class.new(x, y - 1)
  end

  def move_e
    self.class.new(x + 1, y)
  end
end

class UnkownDirectionError < RuntimeError; end
