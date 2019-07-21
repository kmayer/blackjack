RSpec.describe Deck do
  subject(:deck) { Deck.new }

  it "creates a new deck of cards" do
    expect(deck).to be_a(Deck)
    expect(deck.count).to eq(52)
  end

  it "can't be changed" do
    expect { deck.cards[0] = nil }.to raise_error(FrozenError)
  end

  it "can be shuffled" do
    new_deck = deck.shuffle

    expect(new_deck).not_to be(deck)
    expect(new_deck.cards).not_to eq(deck.cards)
  end

  it "can draw a card" do
    card, new_deck = deck.draw

    expect(card).to eq(deck.top)
    expect(new_deck.count).to eq(deck.count - 1)
  end
end

