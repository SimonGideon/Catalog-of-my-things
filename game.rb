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
    today = Date.today
    two_years_ago = Date.new(today.year - 2, today.month, today.day)
    super && @last_played_at < two_years_ago
  end

  def file_name
    'games.json'
  end
end

