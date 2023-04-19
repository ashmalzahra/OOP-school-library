require 'json'
module Storage
  def preserve_data
    puts "All the data has been saved successfully.\n"
    save_books
    save_people
    save_rentals
  end

  def save_books
    books_ojects = []
    @books.each { |book| books_ojects << { title: book.title, author: book.author } }
    File.write('books.json', books_ojects.to_json)
  end

  def save_people
    people_ojects = []
    @people.each do |people|
      if people.instance_of?(::Student)
        people_ojects << { age: people.age, name: people.name,
                           parent_permission: people.parent_permission, id: people.id, type: 'Student'  }
      else
        people_ojects << { age: people.age, specialization: people.specialization, name: people.name, id: people.id, type: 'Teacher'  }
      end
    end
    File.write('people.json', people_ojects.to_json)
  end

  def save_rentals
    rental_ojects = []

    @rentals.each do |rental|
      book = { title: rental.book.title, author: rental.book.author }
      if rental.person.instance_of?(::Student)
        student = { age: rental.person.age, name: rental.person.name,
                    id: rental.person.id, type: 'Student' }
        rental_ojects << { date: rental.date, book: book, person: student }
      else
        teacher = { age: rental.person.age, specialization: rental.person.specialization, name: rental.person.name,
                    id: rental.person.id, type: 'Teacher'  }
        rental_ojects << { date: rental.date, book: book, person: teacher }
      end
    end
    File.write('rentals.json', rental_ojects.to_json)
  end

  def load_books
    list_books = []
    if File.exist?('books.json') && !File.empty?('books.json')
      data = JSON.parse(File.read('books.json'))
      data.each { |book| list_books << Book.new(book['title'], book['author']) }
    end
    list_books
  end

  def load_people
    list_people = []
    if File.exist?('people.json') && !File.empty?('people.json')
      data = JSON.parse(File.read('people.json'))
      data.each do |person|
        if person['type'] == 'Student'
          student = Student.new(person['age'], person['name'])
          student.id = person['id']
          list_people << student
        else
          teacher = Teacher.new(person['age'], person['specialization'], person['name'])
          teacher.id = person['id']
          list_people << teacher
        end
      end
    end
    list_people
  end

  def load_rentals
    list_rentals = []
    if File.exist?('rentals.json') && !File.empty?('rentals.json')
      data = JSON.parse(File.read('rentals.json'))
      data.each do |rental|
        book = Book.new(rental['book']['title'], rental['book']['author'])
        if rental['person']['type'] == 'Student'
          student = Student.new(rental['person']['age'], rental['person']['name'])
          student.id = rental['person']['id']
          list_rentals << Rental.new(rental['date'], book, student)
        else
          teacher = Teacher.new(rental['person']['age'], rental['person']['specialization'], rental['person']['name'])
          teacher.id = rental['person']['id']
          list_rentals << Rental.new(rental['date'], book, teacher)
        end
      end
    end
    list_rentals
  end
end