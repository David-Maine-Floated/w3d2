class Card 
  attr_reader :face_down, :face_value
  def intialize(face_value) 
    @face_value = face_value
    @face_down = true 
    @default_value = " "
    @shown_value = @default_value
  end    

  def card_information 
    if self.face_down 
      puts 'card is face down.' 
      self.default_value
    else  
      self.face_value    
    end  
  end   

  def hide 
    if !self.face_down
      self.face_down = true 
      @shown_value = @default_value
    end    
  end

  def reveal 
    if self.face_down
      puts self.face_value
      @shown_value = @face_value
      self.face_down = false 
    end    
  end    

end   