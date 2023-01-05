require './book'
require './person'

person = Person.new(22, "Adel", true)

describe Book do
   context "When testing the Book class" do
      it "The add_rental method should add the current book to rentals" do
         book = Book.new("Game Of Thrones", "Ahmed")
         book.add_rental(person, "05-01-2023")
         expect(book.rentals.length).to eq 1
      end

   end
end