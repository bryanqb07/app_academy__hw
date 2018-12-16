require_relative 'tile'
require 'colorize'
require 'byebug'


class Board
  # @@file = 'sudoku1.txt'
  @@file = 'test_win.txt'
  @@empty_grid = Array.new(9){Array.new(9)}


  def initialize(grid = @@empty_grid)
    @grid = grid
    from_file
  end

  def from_file
    File.readlines(@@file).each_with_index do |line, idx|
      line.chomp.to_s.split('').each_with_index do |val, idx2|
          @grid[idx][idx2] = Tile.new(val) #red
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
  puts "   #{(0..8).to_a.join(' ')}"
  puts "  __________________"
  grid.each_with_index do |row, i|
    puts "#{i}| #{row.join(' ')}|"
  end
  puts ""
  end
  #
  # def win
  #   winning_combo = [1,2,3,4,5,6,7,8,9]
  #   int_grid = self.dup
  # end
  #
  # def dup
  #   duped_grid = grid.map do |row|
  #     row.map {|tile| Tile.new(tile.value_to_i)}
  #   end
  #   Board.new(duped_grid)
  # end

  private
  attr_reader :grid

end
