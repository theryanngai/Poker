require 'hand'

describe '#Hand' do
  subject(:hand) { Hand.new([card1, card2, card3, card4, card5]) }
  let(:hand2)    { Hand.new([card1, card2, card3, card4, card6]) }
  let(:hand3)    { Hand.new([card1, card2, card7, card4, card5]) }
  let(:card1) {Card.new(:spades, :three)}
  let(:card2) {Card.new(:hearts, :three)}
  let(:card3) {Card.new(:diamonds, :three)}
  let(:card4) {Card.new(:spades, :ace)}
  let(:card5) {Card.new(:hearts, :ace)}
  let(:card6) {Card.new(:spades, :deuce)}
  let(:card7) {Card.new(:diamonds, :ace)}
  
  it "contains 5 cards upon initialization" do
    # hand = Hand.new([card1, card2, card3, card4, card5])
    expect(hand.count).to eq(5)
  end
  
  it "recognizes the best configuration it contains" do
    expect(hand.best_hand).to eq(:full_house)
  end
  
  it "knows if it beats another hand" do
    expect(hand.beats?(hand2)).to eq(true)
  end
  
  it "handles tie combos" do
    expect(hand.beats?(hand3))to eq(false)
  end
  
  #recognizes if it can beat another hand
  #can drop and take single cards
end

