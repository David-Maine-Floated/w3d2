require "byebug"
require_relative 'card'

#we probably want to populate when we call the board

class Board 

  attr_reader :grid

  @@elements = ("a".."h").to_a

  def initialize
    @grid = Array.new(4) { Array.new(4, nil) }
    @size = @grid.length * @grid.length
    self.populate
    #@grid should take in cards as an arg
  end
  #populate board with @board,size / 2 , end up with 2 of each card 

  def populate
    # debugger  
    new_arr = @@elements + @@elements
    while new_arr.length > 0
      # debugger 
      i_one = rand(0...@grid.length)
      i_two = rand(0...@grid.length)
      
      if @grid[i_one][i_two] == nil
        # debugger 
        curr_el = new_arr.pop
        @grid[i_one][i_two] = Card.new(curr_el)
      end
    end
  end

  def render
    @grid.each do |row|
      row_to_puts = ""
      row.each { |card| row_to_puts += "|" + card.shown_value + " " }  
      puts row_to_puts
    end  
  end

  def won?  
    @grid.any? do |row|
      return false  if row.any? {|card| card.face_down} 
    end  
    return true  
  end  

  def reveal(guessed_pos)
    row, col = guessed_pos
    card = @grid[row][col]
    if card.face_down
      card.reveal 
      return card.face_value
    end  
  end  

end 