require './teacher'

describe Teacher do
  context 'When testing the Teacher class' do
    it 'The Teacher should be able to use service by default' do
      teacher = Teacher.new(22, 'Yousef', 'Mathematic')
      expect(teacher.can_use_services?).to be true
    end
  end
end
