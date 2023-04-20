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