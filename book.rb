class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def add_rental(person, date)
    Rental.new(date, person, self)
  end

  attr_accessor :title, :author, :rental
end
