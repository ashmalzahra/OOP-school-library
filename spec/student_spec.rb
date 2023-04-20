require_relative '../student'

describe Student do
  before(:each) do
    @student = Student.new(25, 'Uthman', true)
    @a1 = Classroom.new('A1')
  end

  it 'should create an instance of Student' do
    expect(@student).to be_an_instance_of(Student)
  end

  it "should set the classroom as a1" do
    @student.classroom = @a1
    expect(@student.instance_variable_get(:@classroom)).to eq @a1
  end
end
