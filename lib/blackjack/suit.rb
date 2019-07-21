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
