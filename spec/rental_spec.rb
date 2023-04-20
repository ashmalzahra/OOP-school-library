describe Rental do
  before(:each) do
    @book = Book.new("Raheequl Makhtum", "Saifur Rahman")
    @person = Person.new(30, "Jhora", parent_permission: true)
    @rental = Rental.new('2023/04/19', @person, @book)
  end

  it 'should create an instance of Rental' do
    expect(@rental).to be_an_instance_of(Rental)
  end

  it "should initialize with a person instance" do
    expect(@rental.instance_variable_get(:@person)).to be_an_instance_of(Person)
  end

  it "should initialize with a book instance" do
    expect(@rental.instance_variable_get(:@book)).to be_an_instance_of(Book)
  end
end
