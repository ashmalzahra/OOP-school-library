require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before(:each) do
    @classroom = Classroom.new('A1')
    @student1 = Student.new(22, 'Nilton', true)
    @student2 = Student.new(22, 'Nelson', true)
  end
  it 'should have a label' do
    expect(@classroom).to be_an_instance_of(Classroom)
  end
  it 'Create a Rental instance and push the rental into book rentals variable' do
    @classroom.add_student(@student1)
    @classroom.add_student(@student2)
    expect(@classroom.instance_variable_get(:@students).length).to eq(2)
  end
end
