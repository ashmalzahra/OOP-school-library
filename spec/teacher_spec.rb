require_relative '../teacher'

describe Teacher do
  before(:each) do
    @teacher = Teacher.new(55, 'Moore', 'Data Science')
  end

  describe '#new' do
    it 'should create an instance of Teacher' do
      expect(@teacher).to be_an_instance_of(Teacher)
    end

    it "should initialize specialization as 'Data Science'" do
        expect(@teacher.instance_variable_get(:@specialization)).to eq 'Data Science'
      end
  end

  describe '#can_use_services?' do
    it 'should always return true' do
        expect(@teacher.can_use_services?).to be_truthy
    end
  end
end