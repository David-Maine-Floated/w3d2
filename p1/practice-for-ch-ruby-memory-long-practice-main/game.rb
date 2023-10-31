require_relative 'card'
require_relative 'board'

class Game 

  attr_accessor :previously_guessed_position 

  def initialize
    @new_board = Board.new
    @previously_guessed_position = nil 
    @guessed_position = nil 
  end    

  def make_guess(pos)
    row, col = pos
    @new_board.reveal(pos)
    if previously_guessed_position == nil
      previously_guessed_position = pos
    else
      pi1, pi2 = previously_guessed_position
      if @new_board[pi1][pi2].face_value != @new_board[row][col].face_value
        @new_board[pi1][pi2].hide
        @new_board[row][col].hide
      end
      @previously_guessed_position = nil
    end
  end

  def play 
    while !@new_board.won? 
      @new_board.render
      puts "please enter a position in the format : `0 1`"
      input = gets.chomp.split(" ").map(&:to_i)
      raise "that doesn't work you bad lil man" if input.length != 2

      make_guess(input)

    end
  end

end    