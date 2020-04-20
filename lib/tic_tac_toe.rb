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
  ##move
  def move(index, token = "X")
    @board[index] = token
  end
  
  ##checks to see if the move is vacant, ran after input_to_index
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  ##checks for a valid move
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    puts "Please enter a number 1-9:"
    input = gets.chomp
    input = input_to_index(input)
    cp = current_player
    if valid_move?(input)
      move(input, cp)
      display_board
    else
      turn
    end
  end
  
  def won?
    a = WIN_COMBINATIONS.find{|combo| @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
    }

    b = WIN_COMBINATIONS.find{|combo| @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
    }

    return a||b
  end
  
  def full?
    !@board.any? {|token| token == "" || token == " " }
  end
    
  def draw?
    full? && !won?
  end
  
  def over?
    won? || full?
  end
  
  def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end
  end

  
  
  def play
    @board = board || Array.new(9," ")
    turn until over?

      if won? 
        puts "Congratulations #{winner}!"
      else
        puts "Cat's Game!"
      end
    end
  end
  
  
  
  
end