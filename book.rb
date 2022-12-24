# class Book
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(book, person, date)
    Rental.new(book, person, date)
  end
end

# class Rental
class Rental
  attr_accessor :date, :person, :book

  def initialize(book, person, date)
    @date = date
    @person = person
    @book = book
    book.rentals.push(self)
    person.rentals.push(self)
  end
end
