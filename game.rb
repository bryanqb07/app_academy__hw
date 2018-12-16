require_relative 'board'
require 'byebug'
class SudokuGame
  def initialize
    @board = Board.new
  end

  def play
    while !self.won?
      # debugger
      @board.render
      pos, val = guess_prompt
      update(pos, val)
    end
  end

  def guess_prompt
    puts "Please input a position and a value (pos,pos) val"
    print "Position: "
    pos = gets.chomp
    int_pos = parse(pos)
    puts ""
    print "Value: "
    val = gets.chomp
    [int_pos, val]
  end


  def parse(pos)
    pos_arr = pos.split(' ')
    [pos_arr[0].to_i, pos_arr[1].to_i]
  end

  def update(pos,val)
    if @board[pos].given?
      puts "Original board values cannot be altered."
    else
      @board[pos] = val
    end
  end

  def won?
    false
  end

end

if $PROGRAM_NAME == __FILE__
  SudokuGame.new.play
end
