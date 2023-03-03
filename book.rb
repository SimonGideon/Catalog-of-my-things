require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(args)
    super(args[:genre], args[:author], args[:source], args[:label], args[:publish_date])
    @publisher = args[:publisher]
    @cover_state = args[:cover_state]
  end

  def can_be_archived?
    super || @cover_state == 'bad'

    false
  end

  def to_hash
    {
      'id' => @id,
      'genre' => @genre.map(&:to_hash),
      'author' => @author,
      'source' => @source,
      'label' => @label.map(&:to_hash),
      'publish_date' => @publish_date.to_s,
      'archived' => @archived,
      'publisher' => @publisher,
      'cover_state' => @cover_state
    }
  end
end
