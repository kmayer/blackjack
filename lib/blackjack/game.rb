require_relative "deck"
# https://www.rubytapas.com/2017/04/03/episode-473-contextual-identity-part-2/

class Game
  attr_reader :history

  def initialize(deck, players)
    @history = [Turn.new(deck, players, "Initial game set up")]
  end

  def latest_turn
    history.first
  end

  def deck
    latest_turn.deck
  end

  def players
    latest_turn.players
  end

  # Draws a card from the deck
  # Adds a new turn on the game history (most recent first)
  # Returns the card that was drawn
  def draw(player)
    card, new_deck = deck.draw
    next_turn = Turn.new(new_deck, update_player_hand(card, player), "#{card} => #{player}")
    history.unshift(next_turn)

    card
  end

  # Deal N cards to each player
  def deal(count)
    count.times do
      players.each do |player|
        card = draw(player)
        # Give ourselves an opportunity to chat
        if block_given?
          yield card, player, deck, players
        end
      end
    end
  end

  private

  # Returns an updated player hand
  def update_player_hand(card, player)
    players.map { |p| p == player ? Player.new(p.name, p.hand + [card]) : p }
  end
end