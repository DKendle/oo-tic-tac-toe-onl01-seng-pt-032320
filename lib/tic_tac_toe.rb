class TicTacToe
  attr_accessor :board
  WIN_COMBINATIONS = [
    [0,1,2],
    [0,4,8],
    [0,3,6],
    [1,4,7],
    [2,4,6],
    [3,4,5],
    [6,7,8],
    [8,5,2]
    ]
  
  def initialize
    @board = board || Array.new(9, " ")
  end
  
  def display_board
    
  end
  
end