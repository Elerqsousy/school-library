require './nameable'

describe Nameable do
  context 'When testing the Nameable class' do
    it 'The correct_name method should raise an error' do
      nameable = Nameable.new
      expect do
        nameable.correct_name
      end.to raise_error("#{nameable.class} has not implemented method 'correct_name'", NotImplementedError)
    end
  end
end

describe Decorator do
  context 'When testing the Decorator class' do
    it 'The correct_name method should raise an error' do
      decorator = Decorator.new('Name')
      expect { decorator.correct_name }.to raise_error(NoMethodError)
    end
  end
end
