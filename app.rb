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
    
    def create_person
        print "Do you want to create a student (1) or teacher (2) [Input a number]: "
        person = gets.chomp.to_i

        case person

        when 1
            print 'Age: '
            age = gets.chomp.to_i
            print 'Name: '
            name = gets.chomp
            print 'Has parent permissiom [Y/N]? '
            permission = gets.chomp.downcase

            case permission
            when 'y'
            parent_permission = true
            when 'n'
            parent_permission = false
            else
            puts "Invalid input. Please enter 'Y' or 'N'"
            end

            student = Student.new(age, name, parent_permission: parent_permission)
            @people << student

            puts 'Student created successfully'

        when 2
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
    end
end


