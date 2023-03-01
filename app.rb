require_relative 'label'
require_relative 'item'
require_relative 'game'
require_relative 'book'
require_relative 'author'
require 'date'

class App
  attr_accessor :genre, :author, :source, :label, :publish_date, :cover_state, :choice, :labels, :books
  attr_reader :id, :archived

  def initialize
    @labels = []
    @books = []
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

  def list_all_labels
    if labels.empty?
      puts 'No labels found'
    else
      labels.each do |label|
        puts "Title: #{label.title} | Color: #{label.color}"
      end
    end
  end

  def create_book
    print "Book's genre: "
    @genre = gets.chomp
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
    book = Book.new({ genre: @genre, author: @author, source: @source, label: label, publish_date: @publish_date,
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

  def get_game_info
    puts 'Genre: '
    genre = gets.chomp
    puts 'Author: '
    author = gets.chomp
    puts 'Source: '
    source = gets.chomp
    puts 'Label: '
    label = gets.chomp
    puts 'Publish Date[yyyy-mm-dd]: '
    date = gets.chomp
    GameTemplate = Struct.new(:genre, :author, :source, :label, :publish_date)
    game_info = GameTemplate.new(genre, author, source, label, date)
    game_info
  end

  def create_game
    game_info = get_game_info
    puts 'Is it a multiplayer game?[y/n]: '
    answer = gets.chomp
    multiplayer = false
    multiplayer = true if answer == 'y'
    puts 'When was the game last played[yyyy-mm-dd]?: '
    last_played_at = gets.chomp
    game = Game.new(game_info, multiplayer, last_played_at)
   @games << {
   :id => game.id,
   :genre => game_info.genre,
   :author => game_info.author,
   :source => game_info.source,
   :label => game_info.label,
   :date => game_info.date,
   :multiplayer => multiplayer,
   :last_played_at => last-played-at 
   } 
   end

   def list_games
    @games.each do |game|
      puts "Genre: #{game[:genre]}, Author: #{game[:author]}, Source: #{game[:source]}, Label: #{game[:label]}, Date: #{game[:date]}, Multiplayer: #{game[:multiplayer]}, Last Played Date: #{game[:last_played_at]}"
    end
    end
end
