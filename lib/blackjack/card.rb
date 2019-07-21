class Card
  include Comparable

  attr_reader :suit, :symbol, :name, :rank

  def initialize(suit, symbol, name = "?", rank = 0)
    @suit   = suit
    @symbol = symbol
    @name   = name
    @rank   = rank
    freeze
  end

  def ==(other)
    symbol == other.symbol && suit == other.suit
  end

  def <=>(other)
    # https://www.rubytapas.com/2017/03/27/episode-472-contextual-identity/
    [rank, suit] <=> [other.rank, other.suit]
  end

  def to_s
    "#{symbol}#{suit}"
  end

  def inspect
    "<Card(#{name} of #{suit.name})>"
  end
end
