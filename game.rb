require_relative './item.rb'
require 'date'

class Game < Item
    attr_accessor :multiplayer, :last_played_at

    def initialize(multiplayer, last_played_at)
        @multiplayer = multiplayer
        @last_played_at = Date.parse(last_played_at)
    end

    def can_be_archived?
        current_year = DateTime.now
        current_year = current_date.strftime "%Y"
        age = current_year - last_played_at.year
        if super && age > 2
            return true
        end
        return false
    end
end