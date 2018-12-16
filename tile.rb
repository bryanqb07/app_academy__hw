

class Tile
  def initialize(value, given = false)
    @value = value
    @given = (@value == "0")
  end

  def given?
    @given
  end

  def to_s
    @given ? "X".colorize(:red) : @value.to_s.colorize(:blue)
  end

end
