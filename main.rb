require_relative 'app'
require_relative 'files_manager'
require_relative 'game'

@file_manager = FileManager.new
GameTemplate = Struct.new(:genre, :author, :source, :label, :publish_date)
game_in = GameTemplate.new('', '', '', '', '2012-02-02')
@game = Game.new(game_in, true, '2022-2-2')

def display_menu
  puts 'What would you like to do?'
  puts '1. List all books'
  puts '2. List all genres'
  puts '3. List all labels'
  puts '4. List all authors'
  puts '5. List all games'
  puts '6. Add a book'
  puts '7. Add a music album'
  puts '8. Add a game'
  puts '9. Quit'
end

def menu_choice
  print 'Enter the number of your choice: '
  gets.chomp.to_i
end

def list_items(choice, app)
  case choice
  when 1
    app.list_all_books
  when 2
    app.list_all_genres
  when 3
    app.list_all_labels
  when 4
    app.list_all_authors
  when 5
    app.list_games
  end
end

def handle_menu_choice(choice, app)
  case choice
  when 1, 2, 3, 4, 5
    list_items(choice, app)
  when 6, 7, 8
    create_item(choice, app)
  when 9
    @file_manager.write_on_file(@game.file_name, app.games)
    app.save_data
    return true
  else
    puts 'Invalid option entered'
  end
  false
end

def create_item(choice, app)
  case choice
  when 6
    app.create_album
    app.create_book
  when 7
    app.create_album(app)
  when 8
    app.create_game
  end
end

def main
  app = App.new
  app.add_games_from_file(@file_manager.read_from_file(@game.file_name))
  quit = false
  until quit
    display_menu
    choice = menu_choice
    quit = handle_menu_choice(choice, app)
  end
end

main
