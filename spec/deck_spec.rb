require 'deck'

describe '#Deck' do
  subject(:deck) { Deck.new }
  let(:card) { Card.new(:hearts, :king) }
  let(:card2) { Card.new(:hearts, :queen) }

  it "should contain 52 cards" do
    expect(deck.count).to eq(52)
  end

  it "should not contain any duplicates" do
    expect(deck.cards.uniq).to eq(deck.cards)
  end
  
  it "should successfully take cards from the top of the deck" do
    first_two = deck.cards[0..1]
    expect(deck.take(2)).to eq (first_two)
  end
  
  it "should remove taken cards from the deck" do
    deck.take(2)
    expect(deck.count).to eq(50)
  end
  
  it 'should place cards at the bottom of the deck' do
     deck.return([card, card2])
     expect(deck.cards[-2..-1]).to eq([card, card2])
  end
end
  
  