class Rental
  def initialize(date, person, book)
    @date = date

    @person = person
    person.rental << self

    @book = book
    book.rental << self
  end

  attr_accessor :date, :person, :book
end
