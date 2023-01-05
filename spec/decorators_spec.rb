require './nameable'

describe Nameable do
   context "When testing the Nameable class" do
      it "The correct_name method should raise an error" do
        nameable = Nameable.new
        expect {nameable.correct_name}.to raise_error("#{nameable.class} has not implemented method 'correct_name'", NotImplementedError)
      end
   end
end

describe Decorator do
  context "When testing the Decorator class" do
     it "The correct_name method should raise an error" do
      nameable = Nameable.new
      decorator = Decorator.new(nameable)
      expect {decorator.correct_name}.to raise_error("#{nameable.class} has not implemented method 'correct_name'", NotImplementedError)
     end
  end
end

