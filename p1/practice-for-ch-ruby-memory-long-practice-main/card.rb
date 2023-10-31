class Card 
    
  attr_reader :face_down, :face_value, :shown_value

    def initialize(face_value) 
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
      self.face_down = true 
      @shown_value = @default_value
    end

    def reveal
      self.face_down = false
      @shown_value = @face_value
        # if self.face_down
        #     puts self.face_value
            # @shown_value = @face_value
        #     self.face_down = false 
        # end    
    end    

    def to_s 
      if !face_down
        return @face_value
      else  
        return @default_value
      end  
    end
    
    # def ==

    # end    

end   