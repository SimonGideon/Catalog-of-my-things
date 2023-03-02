require_relative 'label'
require_relative 'item'
require_relative 'game'
require_relative 'book'
require_relative 'author'
require_relative 'genre'
require_relative 'music_album'
require 'date'

class App
  attr_accessor :genre, :author, :source, :label, :publish_date, :cover_state, :choice, :labels, :books
  attr_reader :id, :archived

  def initialize
    @labels = []
    @books = []
    @genres = []
    @music_album = []
  end

  def list_all_books
    if books.empty?
      puts 'No books found'
    else
      books.each_with_index do |book, index|
        puts "#{index + 1}) Genre: #{book.genre} Author: #{book.author}"
      end
    end
  end

  def list_all_genres
    if @genres.empty?
      puts 'No genre exists '
    else
      @genres.each do |genre|
        puts 'Genres: '
        puts "        #{genre.name}"
      end
    end
  end

  def genre_options
    genre_name = gets.chomp
    genre = Genre.new(genre_name)
    @genres << genre
  end

  def list_all_labels
    if labels.empty?
      puts 'No labels found'
    else
      labels.each do |label|
        puts "Title: #{label.title} | Color: #{label.color}"
      end
    end
  end

  def create_album
    print 'Music genre: '
    genre = genre_options
    print 'Music Artist: '
    author = gets.chomp
    print 'Music Source: '
    source = gets.chomp
    print 'Add Music Label: '
    label = label_options
    print 'Music production date (yyyy-mm-dd): '
    production_date = gets.chomp
    on_spotify = on_spotify_option
    music_album = Struct.new(:genre, :author, :source, :label, :publish_date)
    album_info = music_album.new(genre, author, source, label, production_date)
    album = Album.new(album_info, on_spotify: on_spotify)
    @music_album << album
  end

  def on_spotify_option
    print 'Is Music on Spotify? '
    print 'Yes/No: '
    on_spotify = gets.chomp
    check_spotify(on_spotify)
  end

  def check_spotify(on_spotify)
    case on_spotify.downcase
    when 'yes'
      true
    when 'no'
      false
    else
      puts 'Invalid input, please try again'
      on_spotify_option
    end
  end

  # this has not implemented on the UI options menu
  def list_all_albums
    @music_album.each do |music|
      puts "Title: #{music.title} | Produced on: #{music.publish_date}"
    end
  end

  def create_book
    print "Book's genre: "
    @genre = genre_options
    print "Book's author: "
    @author = gets.chomp
    print "Book's source: "
    @source = gets.chomp
    print "Book's label title: "
    label = label_options
    print "Book's publish date (yyyy-mm-dd): "
    @publish_date = gets.chomp
    print "Book's publisher: "
    publisher = gets.chomp
    print "Book's cover state (good/bad): "
    @cover_state = gets.chomp
    book = Book.new({ genre: genre, author: @author, source: @source, label: label, publish_date: @publish_date,
                      publisher: publisher, cover_state: @cover_state })
    books.push(book)
    puts 'Book created succesfully', ''
  end

  def label_options
    label_title = gets.chomp
    print "Label's color: "
    label_color = gets.chomp
    label = Label.new(label_title, label_color)
    labels.push(label)
  end
end
