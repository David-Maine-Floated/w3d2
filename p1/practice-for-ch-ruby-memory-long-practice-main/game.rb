require_relative 'card'
require_relative 'board'


class Game 
  attr_accessor :previously_guessed_position
  def initialize
    @new_board = Board.new
    @previously_guessed_position = nil 
  end    

end    