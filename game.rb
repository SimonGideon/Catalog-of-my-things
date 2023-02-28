require_relative './item.rb'
require 'date'

class Game < Item
    attr_accessor :multiplayer, :last_played_at

    def initialize(genre = "Unknown", author= "Unknown", source= "Unknown", label= "Unknown", publish_date = "2022-02-15", multiplayer, last_played_at)
        super(genre, author, source, label, publish_date)
        @multiplayer = multiplayer
        @last_played_at = Date.parse(last_played_at)
    end

    def can_be_archived?
        current_year = DateTime.now
        current_year = current_date.strftime "%Y"
        age = current_year - last_played_at.year
        return true if super && age > 2
        false
    end
end