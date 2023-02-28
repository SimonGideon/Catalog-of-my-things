require_relative 'item'

class Album < Item
  attr_accessor :on_spotify

  def initialize(genre, author, source, publish_date, on_spotify)
    super(genre, author, source, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    Item.can_be_archived? || @on_spotify
  end
end
