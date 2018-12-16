require_relative 'board'
class SodokuGame
  def initialize
    @board = Board.new
    @board.from_file
  end

  def play
    unless self.won?
      @board.render
      pos, val = guess_prompt
      update(pos, val)
  end

  def guess_prompt
    puts "Please input a position and a value (pos,pos) val"
    print "Position: "
    pos = gets.chomp
    int_pos = parse(pos)
    puts
    print "Value: "
    val = gets.chomp
    int_pos, val
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
