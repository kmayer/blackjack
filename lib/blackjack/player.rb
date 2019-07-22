class Player
  attr_reader :name, :hand

  def initialize(name, hand = [])
    @name = name
    @hand = hand
    deep_freeze
  end

  def to_s
    name
  end
end
