require_relative 'deck'

class Hand
  WINNING_COMBOS = {
    :high_card => 1,
    :pair => 2,
    :two_pair => 3,
    :three_of_kind => 4,
    :straight => 5,
    :flush => 6,
    :full_house => 7,
    :four_of_kind => 8,
    :straight_flush => 9
  }
  attr_reader :deck
  
  def initialize(cards)
    @cards = cards
    sort_hand
  end
  
  def count
    @cards.count
  end
  
  def best_hand
    return :straight_flush if straight? && flush?
    return :four_of_kind if match_finder == :four_of_kind
    return :full_house if match_finder == :full_house
    return :flush if flush?
    return :straight if straight?
    
    match_finder  
  end
  
  def sort_hand
    sorted = false
    
    until sorted
      sorted = true
      0.upto(count - 2) do |i|
        if @cards[i].poker_value > @cards[i + 1].poker_value
          @cards[i], @cards[i + 1] = @cards[i + 1], @cards[i]
          sorted = false
        end
      end
    end
  end
  
  def straight? #fix ace trouble
    0.upto(count - 2) do |i|
      return false unless @cards[i + 1].poker_value - @cards[i].poker_value == 1
    end
    
    true
  end
  
  def flush?
    0.upto(count - 2) do |i|
      return false unless @cards[i + 1].suit == @cards[i].suit
    end
    
    true
  end
  
  def match_finder
    frequency = Hash.new() { |h, k| h[k] = 0 }
    @cards.each do |card|
      frequency[card.poker_value] += 1
    end
    
    if frequency.count == 2
      (frequency.has_value?(4) ? :four_of_kind : :full_house) 
    elsif frequency.count == 3
      (frequency.has_value?(3) ? :three_of_kind : :two_pair)
    elsif frequency.count == 4
      :pair
    else
      :high_card
    end
  end
  
  def beats?(other_hand)
    WINNING_COMBOS[best_hand] > WINNING_COMBOS[other_hand.best_hand]
  end
  
end

#straight check - straights
#match check - 1/2/3/4 of a kind, full house
#flush check - flush
# straight flush = straight check + flush check