require './nameable'
require './person'

person = Person.new(22, "hamzaaaaaaaa", true)

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

describe CapitalizeDecorator do
  context "When testing the CapitalizeDecorator class" do
     it "The correct_name method should capitalize name" do
      cap_decorator = CapitalizeDecorator.new(person)
      expect(cap_decorator.correct_name).to eq "Hamzaaaaaaaa"
     end
  end
end

describe TrimmerDecorator do
  context "When testing the TrimmerDecorator class" do
     it "The correct_name method should capitalize name" do
      trim_decorator = TrimmerDecorator.new(person)
      expect(trim_decorator.correct_name).to eq "hamzaaaaaa"
     end
  end
end

