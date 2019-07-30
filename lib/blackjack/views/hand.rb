require "ice_nine"
require "ice_nine/core_ext/object"

module Views
  class Hand
    attr_reader :player

    def initialize(player)
      @player = player
      deep_freeze
    end

    def call
      "%16s: %s" % [player.name, hand]
    end

    private

    def hand
      player.hand.sort_by(&:rank).map(&:to_s).join(" ")
    end
  end
end