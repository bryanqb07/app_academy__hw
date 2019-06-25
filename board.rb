require_relative 'tile'
require 'colorize'
require 'byebug'


class Board
  # @@file = 'sudoku1.txt'
  @@file = 'sudoku2.txt'
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
  def won?
    sorted_nums = [1,2,3,4,5,6,7,8,9]
    val_grid = self.dup
    row_align?(val_grid, sorted_nums) && col_align?(val_grid,sorted_nums) && square_align?(val_grid,sorted_nums)
  end

  def row_align?(grid, sorted_nums)
    grid.each{|row| return false unless row.sort == sorted_nums}
    true
  end


  def col_align?(grid, sorted_nums)
    (grid.length).times do |i|
      col = []
      grid.each do |row|
        col << row[i]
      end
      return false unless col.sort == sorted_nums
    end
    true
  end

  def square_align?(grid, sorted_nums)
    start_row = 0
    start_col = 0
    while start_row < 9
      while start_col < 9
        hold = []
        square = get_square(start_row, start_col)
        square.each do |pos|
          row, col = pos
          hold << grid[row][col]
        end
        return false unless hold.sort == sorted_nums
        start_col += 3
      end
        start_row += 3
    end
    true
  end

  def get_square(row, col)
    pivot_row = row
    pivot_col = col
    square = [
              [pivot_row, pivot_col],      [pivot_row, pivot_col + 1],     [pivot_row, pivot_col + 2],
              [pivot_row + 1, pivot_col],  [pivot_row + 1, pivot_col + 1], [pivot_row + 1, pivot_col + 2],
              [pivot_row + 2, pivot_col],  [pivot_row + 2, pivot_col + 1], [pivot_row + 2, pivot_col + 2]
            ]
    square
  end


  def dup
    duped_grid = grid.map do |row|
      row.map {|tile| tile.value}
    end
    duped_grid
  end

  private
  attr_reader :grid

end
