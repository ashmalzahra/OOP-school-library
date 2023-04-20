require_relative '../book'
require_relative '../person'
require_relative '../rental'

describe Book do
  before(:each) do
    @book = Book.new('Fault in our Stars', 'John Green')
    @person = Person.new(22, 'Anna', parent_permission: true)
  end

  describe '#new' do
    it 'should have a title and author' do
      expect(@book).to be_an_instance_of(Book)
    end
  end

  describe '#add_rental' do
    it 'Create a Rental instance and push the rental into book rentals variable' do
      @book.add_rental(@person, '2023-04-19')
      expect(@book.instance_variable_get(:@rental).length).to eq(1)
    end
  end
end
