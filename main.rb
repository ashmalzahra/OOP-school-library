# rubocop:disable Metrics/CyclomaticComplexity

require './app'

def main
  app = App.new
  loop do
    puts '
        Welcome to School Library App!
        ___________________________________________
        Please choose an option by entering a number
        1 - List all books
        2 - List all people
        3 - Create a person
        4 - Create a book
        5 - Create a rental
        6 - List all rental for a given person id
        7 - Exit
        ____________________________________________'

    opt = gets.chomp.to_i

    case opt
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_rentals
    when 7
      abort '
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      Thank you for using the OOP School Library App!
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
    end
  end
end

main

# rubocop:enable Metrics/CyclomaticComplexity
