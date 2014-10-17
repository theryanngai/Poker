require_relative 'card'

class Deck
  attr_accessor :cards
  
  def deck_fill #factory method
    all_cards = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        all_cards << Card.new(suit, value)
      end
    end
        
     all_cards 
  end
  
  def initialize
    @cards =  deck_fill
  end
  
  def count
    @cards.count
  end
  
  def take(num)
    @cards.shift(num)
  end
  
  def return(cards)
    @cards += cards
  end
end