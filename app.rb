require './book'
require './person'
require './student'
require './teacher'
require './rental'

class  App
    def initialize
        @people = people
        @books = books
        @rental = rental
    end

    def list_books
        puts "Book Store is currently empty" if @books.empty?
        @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end

    def list_people
        puts "No person registered yet" if @people.empty?
        @people.map { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end  
end