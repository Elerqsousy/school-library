require './book'
require './person'

book = Book.new("Game Of Thrones", "Ahmed")
person = Person.new(22, "Mike", true)

describe Person do
   context "When testing the Book class" do
      it "The add_rental method should add the rental of current person to rentals" do
         person.add_rental(book, "05-01-2023")
         expect(person.rentals.length).to eq 1
      end

      it "The correct_name method should return the person name" do
         expect(person.correct_name).to eq "Mike"
      end

      it "The can_use_services? method should return true" do
         expect(person.can_use_services?).to be true
      end

   end
end