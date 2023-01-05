require './rental'
require './modules/rental'

# class Book
class Book
  include PreserveRental
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = fetch_rental
  end

  def add_rental(person, date)
    Rental.new(self, person, date)
  end
end
