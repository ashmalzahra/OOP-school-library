require_relative '../person'
require_relative '../book'
require_relative '../rental'

describe Person do
  before(:each) do
    @person = Person.new(22, 'Anna', parent_permission: true)
    @book = Book.new('Fault in our Stars', 'John Green')
  end

  describe '#new' do
    it 'should inialize the person class' do
      expect(@person).to be_an_instance_of(Person)
    end
  end

  describe '#of_age?' do
    it 'should always return true for age greater than 18' do
      expect(@person.send(:of_age?)).to be_truthy
    end
  end

  describe '#can_use_services?' do
    it 'should always return true for age greater than 18 or permission is true' do
      expect(@person.can_use_services?).to eql(true)
    end
  end

  describe '#correct_name' do
    it 'should return the given person name' do
      expect(@person.correct_name).to eq('Anna')
    end
  end

  describe '#add_rental' do
    it 'Create a Rental instance and push the rental into person rentals variable' do
      @person.add_rental(@book, '2023-04-19')
      expect(@person.instance_variable_get(:@rental).length).to eq(1)
    end
  end
end

describe Nameable do
  describe '#correct_name' do
    it 'raises error' do
      n = Nameable.new
      expect { n.correct_name }.to raise_error(NotImplementedError)
    end
  end
end

describe Decorator do
  before(:each) do
    @d = Decorator.new('maximilianus')
  end

  describe '#new' do
    it 'initalizes the class' do
      expect(@d).to be_an_instance_of(Decorator)
    end
  end
end

describe CapitalizeDecorator do
  describe '#correct_name' do
    it 'capitalizes the given name' do
      nameable = double('nameable')
      allow(nameable).to receive(:correct_name).and_return('john')
      decorator = CapitalizeDecorator.new(nameable)
      expect(decorator.correct_name).to eq('John')
    end
  end
end

describe TrimmerDecorator do
  describe '#correct_name' do
    it 'trims if the lenght is greater than 10' do
      nameable = double('nameable')
      allow(nameable).to receive(:correct_name).and_return('very long name')
      decorator = TrimmerDecorator.new(nameable)
      expect(decorator.correct_name).to eq('very long ')
    end
  end
end
