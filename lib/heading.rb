class Heading
  attr_reader :heading

  RIGHT_TURNS = {
    'N' => 'E',
    'E' => 'S',
    'S' => 'W',
    'W' => 'N'
  }.freeze

  LEFT_TURNS = {
    'N' => 'W',
    'W' => 'S',
    'S' => 'E',
    'E' => 'N'
  }.freeze

  def initialize(heading = 'N')
    @heading = heading
  end

  def turn_r
    @heading = RIGHT_TURNS[@heading]
  end

  def turn_l
    @heading = LEFT_TURNS[@heading]
  end

  def to_s
    heading
  end
end 
