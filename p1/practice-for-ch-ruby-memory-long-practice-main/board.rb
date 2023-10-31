require "byebug"

#we probably want to populate when we call the board

class Board 

  attr_reader :grid

  # @@elements = ("a".."h").to_a

  def initialize
    @grid = Array.new(4) { Array.new(4, nil) }
    @size = @grid.length / 2
    #@grid should take in cards as an arg
  end
  #populate board with @board,size / 2 , end up with 2 of each card 

  def populate
    new_arr = @@elements + @@elements
    
    while new_arr.length > 0
      i_one = rand(0...@grid.length)
      i_two = rand(0...@grid.length)
      
      if @grid[i_one][i_two] == nil
        curr_el = new_arr.pop
        @grid[i_one][i_two] = Card.new(curr_el)
      end

    end
  end

  def print
    puts @grid.each {|row| puts row.join(" ")}
  end


end 