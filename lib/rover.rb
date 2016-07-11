class Rover
  attr_reader :position, :heading

  def initialize
    @position = [0, 0]
    @heading = 'N'
  end
end
