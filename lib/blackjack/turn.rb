require "ice_nine"
require "ice_nine/core_ext/object"

class Turn
  attr_reader :deck, :players, :description

  def initialize(deck, players, description = "")
    @deck = deck
    @players = players
    @description = description
    deep_freeze
  end
end

