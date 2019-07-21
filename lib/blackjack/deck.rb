require "ice_nine"
require "ice_nine/core_ext/object"
require_relative "card"

CARDS = [["A", "Ace", 1]] +
  (2..10).map { |x| [x.to_s, x.to_s, x] } +
  [["J", "Jack", 11]] +
  [["Q", "Queen", 12]] +
  [["K", "King", 13]]
CARDS.deep_freeze

class Deck
  attr_reader :cards

  def initialize(cards = self.class.default_cards)
    @cards = cards
    deep_freeze
  end

  def self.default_cards
    # https://www.rubytapas.com/2016/12/08/episode-459-array-product/
    SUITS.product(CARDS).map { |(suit, card)| Card.new(suit, *card) }
  end

  def count
    @cards.count
  end

  def shuffle
    self.class.new(cards.shuffle)
  end

  def top
    cards.first
  end

  def draw
    [cards.first, self.class.new(cards[1..-1])]
  end
end