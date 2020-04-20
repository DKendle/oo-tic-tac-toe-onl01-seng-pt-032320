require "pry"

class TicTacToe
  attr_accessor :board
  
  #initializes the board as an array with 9 ""
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  ##Displays an instant of the playing board to the terminal
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  #defines the 8 winning combinations to finish game
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
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    !@board
  end
  
  
end