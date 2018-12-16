class Tile
  def initialize(value, given = false)
    @value = value
    @given = given
  end

  def given?
    @given
  end

end
