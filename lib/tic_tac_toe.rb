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
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end 
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
      if @board[index] == " " || @board[index] == nil
        false 
      else 
        true 
      end
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    @board.count {|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    puts "Please enter 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
      cp = current_player
      index = input_to_index(user_input)
        if valid_move?(index)
          move(index, current_player)
          display_board
        else
          turn
        end
  end
     
     def won?
      a = WIN_COMBINATIONS.find{|combo|
      @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
    }
    
    b = WIN_COMBINATIONS.find{|combo|
      @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
    }
    return a || b
  end
  
  def full?
    !@board.any?{|moves| moves =="" || moves ==" "}
  end
  
  def draw?
    !won? && full?
  end 
  
  def over?
    won? || draw?
  end
  
  def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end
  end
  
  def play 
    @board = board || Array.new(9, " ")
    turn until over?
     won? ? puts("Congratulations #{winner}!") : puts("Cat's Game!")
     
    
  end
game = TicTacToe.new
game.play
end

