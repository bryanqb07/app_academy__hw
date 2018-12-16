require_relative 'tile'
require 'colorize'
require 'byebug'


class Board
  @@file = 'sudoku1.txt'

  attr_reader :grid

  def initialize
    @grid = Array.new(9){Array.new(9)}
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

  # def render
  #    system("clear")
  #    debugger
  #    puts @grid.each{|row| "#{row.join(' ')}"}
  # end

  def render
  puts "  #{(0..8).to_a.join(' ')}"
  puts "  __________________"
  grid.each_with_index do |row, i|
    puts "#{i}| #{row.join(' ')}|"
  end
end


end
#
if $PROGRAM_NAME == __FILE__
  Board.new.render
end
