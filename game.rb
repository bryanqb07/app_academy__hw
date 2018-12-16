require_relative 'board'
require 'byebug'
class SudokuGame
  def initialize
    @board = Board.new
    @dup = Board.new(@board.dup)
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
    print "Position (format: num,num): "
    pos = gets.chomp
    while !guess_check_pos(pos)
      print "Please enter a valid postion: "
      pos = gets.chomp
    end
    int_pos = parse(pos)
    print "Value: "
    val = gets.chomp
    while !guess_check_val(val)
      print "Please enter a valid value: "
      val = gets.chomp
    end
    [int_pos, val]
  end

  def guess_check_pos(pos)
    valid_pos = "012345678"
    pos.length == 3 && valid_pos.include?(pos[0]) && pos[1] == ',' && valid_pos.include?(pos[2])
  end

  def guess_check_val(val)
    valid_nums = "123456789"
    val.length == 1 && valid_nums.include?(val)
  end

  def parse(pos)
    pos_arr = pos.split(',')
    [pos_arr[0].to_i, pos_arr[1].to_i]
  end

  def update(pos,val)
    if @board[pos].given?
      @board[pos] = val.colorize(:green)
      @dup[pos].value = val.to_i
    else
      puts "Original board values cannot be altered. Please try again."
    end
  end

  def won?
    if @dup.won?
      @board.render
      puts "Congratulations! You win!"
      true
    else
      false
    end
  end

end

if $PROGRAM_NAME == __FILE__
  SudokuGame.new.play
end
