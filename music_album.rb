require_relative 'item'

class Album < Item
  attr_accessor :on_spotify

  def initialize(album_info, on_spotify)
    super(*album_info.to_a)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
