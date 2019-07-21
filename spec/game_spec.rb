RSpec.describe Game do
  subject(:game) { Game.new(Deck.new.shuffle, [Player.new("Player A"), Player.new("Dealer")]) }

  it "initializes with a deck of cards and players" do
    expect(Game.new(Deck.new, [Player.new("A")])).to be_a(Game)
  end

  it "can deal out hands to each of the players" do
    game.deal(2) do |card, player, deck, players|
      expect(card).to be_frozen
      expect(player).to be_frozen
      expect(deck).to be_frozen
      expect(players).to be_frozen
    end

    expect(game.deck.count).to eq(48)
    expect(game.players.first.hand.count).to eq(2)
    expect(game.history.count).to eq(5)

    # puts game.history.map(&:description)
  end

  it "can draw a card for a player" do
    card = game.draw(game.players.first)

    expect(game.deck.count).to eq(51)
    expect(game.players.first.hand.count).to eq(1)
    expect(card).to be_a(Card)
  end

  it "can handle more than 1 deck of cards in a game" do
    game = Game.new(Deck.new(Deck.default_cards * 2).shuffle, [Player.new("Player A")])

    expect(game.deck.count).to eq(52 * 2)
    expect(game.deck.cards.filter{|card| card == Card.new(SPADES, "A")}.count).to eq(2)
  end
end