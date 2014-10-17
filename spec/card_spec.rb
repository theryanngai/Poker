require 'card'

describe '#Card' do
  subject(:card) { Card.new(:hearts, :king) }
  
  it 'should have a suit' do
    expect(card.suit).to eq(:hearts)
  end
  
  it 'should have a value' do
    expect(card.value).to eq(:king)
  end
  
  it 'should have a poker value' do
    expect(card.poker_value).to eq(13)
  end
end
  