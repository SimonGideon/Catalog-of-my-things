require 'date'
require_relative 'item'

class Album < Item
  attr_accessor :on_spotify

  def initialize(genre:, author:, source:, label:, publish_date:, **kwargs)
    super(genre, author, source, label, publish_date)
    @on_spotify = kwargs[:on_spotify]
  end

  def can_be_archived?
    super && @on_spotify
  end
end
