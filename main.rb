require_relative 'app'

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
    app.list_all_books
  when 2
    app.list_all_genres
  when 3
    app.list_all_labels
  when 4
    app.list_all_authors
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
    app.create_book
  when 6
    app.create_album
  when 7
    create_game(app)
  end
end

def main
  app = App.new
  quit = false
  until quit
    display_menu
    choice = menu_choice
    quit = handle_menu_choice(choice, app)
  end
end

main
