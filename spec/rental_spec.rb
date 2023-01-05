require './rental'
require './student'
require './book'

student = Student.new(200, 'wizard', false)
book = Book.new('Madraset Al Moshaghbeen', 'Adel Emam')
rental = Rental.new(book, student, '20230105')

describe Rental do
  context 'When testing the rental class' do
    it 'The person should have rental added' do
      expect(student.rentals[0]).to eq rental
    end

    it 'The book should have a record of the rental instance' do
      expect(book.rentals[0]).to eq rental
    end
  end
end
