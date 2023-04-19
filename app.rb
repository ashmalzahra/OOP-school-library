require './book'
require './person'
require './student'
require './teacher'
require './rental'
require 'json'
require './storage'

class App
  attr_accessor :people, :books, :rentals

  include Storage
  def initialize
    @people = load_people || []
    @books = load_books || []
    @rentals = load_rentals || []
  end

  def list_books
    puts "Book Store is currently empty" if @books.empty?
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    puts "No person registered yet" if @people.empty?
    @people.each do |person|
      if person.is_a? Student
        puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      elsif person.is_a? Teacher
        puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_person
    print "Do you want to create a student (1) or teacher (2) [Input a number]: "
    person = gets.chomp.to_i

    case person
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid input. Kindly type 1 or 2'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission [Y/N]? '
    permission = gets.chomp.downcase

    case permission
    when 'y'
      parent_permission = true
    when 'n'
      parent_permission = false
    else
      puts "Invalid input. Please enter 'Y' or 'N'"
    end

    student = Student.new(age, name, parent_permission)
    @people << student

    puts 'Student created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    @people << teacher

    puts 'Teacher created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts 'Book added successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }

    book_id = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_s

    rental = Rental.new(date, @people[person_id], @books[book_id])
    @rentals << rental

    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
  end
end
