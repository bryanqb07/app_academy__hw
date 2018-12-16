require_relative 'tile'
require 'colorize'
require 'byebug'


class Board
  @@file = 'sudoku1.txt'

  def initialize
    @grid = Array.new(9){Array.new(9)}
  end

  def from_file
    debugger
    File.readlines(@@file).each_with_index do |line, idx|
      line.chomp.to_s.split('').each_with_index do |val, idx2|
        if val == "0"
          @grid[idx][idx2] = Tile.new(val.red)
        else
          @grid[idx][idx2] = Tile.new(val.blue, true)
        end
      end
    end
  end

  def [] (pos)
    row, col = pos
    @grid[row][col]
  end


  def []= (pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def render
     system("clear")
     @grid.each{|row| row.join(' ')}
  end

end

if $PROGRAM_NAME == __FILE__
  test = Board.new
  test.from_file
end
