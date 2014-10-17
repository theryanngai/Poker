# -*- coding: utf-8 -*-

class Card
  SUIT_STRINGS = {
      :clubs    => "clubs",
      :diamonds => "diamonds",
      :hearts   => "hearts",
      :spades   => "spades"
    }

    VALUE_STRINGS = {
      :deuce => "2",
      :three => "3",
      :four  => "4",
      :five  => "5",
      :six   => "6",
      :seven => "7",
      :eight => "8",
      :nine  => "9",
      :ten   => "10",
      :jack  => "J",
      :queen => "Q",
      :king  => "K",
      :ace   => "A"
    }

    POKER_VALUE = {
      :deuce => 2,
      :three => 3,
      :four  => 4,
      :five  => 5,
      :six   => 6,
      :seven => 7,
      :eight => 8,
      :nine  => 9,
      :ten   => 10,
      :jack  => 11,
      :queen => 12,
      :king  => 13,
      :ace => 14
    }
    
    attr_reader :suit, :value, :poker_value
    
    def assign_poker_value(value) #factory method
      POKER_VALUE[value]
    end
    
    def initialize(suit, value)
      @suit, @value = suit, value
      @poker_value = assign_poker_value(value)
    end
    
    def self.suits
      SUIT_STRINGS.keys
    end
    
    def self.values
      VALUE_STRINGS.keys
    end
    
end
  