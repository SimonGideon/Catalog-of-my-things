require_relative 'item'

class Album < Item
  attr_accessor :on_spotify

  def initialize(album_info, on_spotify)
    super(album_info.genre, album_info.author, album_info.source, album_info.label, album_info.publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_hash
    {
      genre: @genre.map(&:to_hash),
      author: @author,
      source: @source,
      label: @label.map(&:to_hash),
      publish_date: @publish_date,
      on_spotify: @on_spotify
    }
  end
end
