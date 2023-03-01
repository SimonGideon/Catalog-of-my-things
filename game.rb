require_relative './item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(game_info, multiplayer, last_played_at)
    super(game_info.genre, game_info.author, game_info.source, game_info.label, game_info.publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    current_year = DateTime.now.year
    age = current_year - @last_played_at.year
    return true if super && age > 2

    false
  end

  def file_name
    'game.json'
   end
end
