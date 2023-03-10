require './nameable'
require './book'
require './modules/rental'
# Class Person
class Person < Nameable
  include PreserveRental
  attr_accessor :name, :age, :rentals, :parent_permission
  attr_reader :id

  def initialize(age, name, parent_permission)
    super()
    @id = Random.rand(1..9999)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(book, date)
    Rental.new(book, self, date)
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
