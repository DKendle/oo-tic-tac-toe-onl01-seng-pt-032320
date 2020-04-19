class TicTacToe
  attr_accessor :board
  
  
  def initialize
    @board = board || Array.new(9, " ")
  end
  
  
end