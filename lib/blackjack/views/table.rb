require "ice_nine"
require "ice_nine/core_ext/object"
require_relative "hand"

module Views
  class Table
    attr_reader :players
    def initialize(turn)
      @players = turn.players
    end

    def call
      players.each do |player|
        hand_view = Hand.new(player)
        yield hand_view.call
      end
    end
  end
end