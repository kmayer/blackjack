class Suit
  attr_reader :symbol, :name, :rank

  def initialize(symbol, name, rank)
    @symbol = symbol
    @name = name
    @rank = rank
    freeze
  end

  def to_s
    symbol
  end

  def ==(other)
    symbol == other.symbol
  end

  def <=>(other)
    rank <=> other.rank
  end
end

# https://en.wikipedia.org/wiki/High_card_by_suit
SPADES = Suit.new("♤", "Spades", 4)
CLUBS = Suit.new("♧", "Clubs", 1)
HEARTS = Suit.new("♡", "Hearts", 3)
DIAMONDS = Suit.new("♢︎", "Diamonds", 2)

SUITS = [SPADES, CLUBS, HEARTS, DIAMONDS]

