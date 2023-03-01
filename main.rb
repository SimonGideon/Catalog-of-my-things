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

  def display_menu
    puts 'What would you like to do?'
    puts '1. List all books'
    puts '2. List all genres'
    puts '3. List all labels'
    puts '4. List all authors'
    puts '5. Add a book'
    puts '6. Add a music album'
    puts '7. Add a game'
    puts '8. Quit'
  end

  def menu_choice
    print 'Enter the number of your choice: '
    gets.chomp.to_i
  end

  def handle_menu_choice(choice, app)
    case choice
    when 1
      list_all_books
    when 2
      list_all_genres
    when 3
      list_all_labels
    when 4
      list_all_authors
    when 5, 6, 7
      create_item(choice, app)
    when 8
      return true
    else
      puts 'Invalid option entered'
    end
    false
  end

  def create_item(choice, app)
    case choice
    when 5
      create_book(app)
    when 6
      create_album(app)
    when 7
      create_game(app)
    end
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

  def create_book(_app)
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
end

def label_options
  label_title = gets.chomp
  print "Label's color: "
  label_color = gets.chomp
  label = Label.new(label_title, label_color)
  labels.push(label)
end

def main
  app = App.new
  quit = false
  until quit
    app.display_menu
    choice = app.menu_choice
    quit = app.handle_menu_choice(choice, app)
  end
end

main
