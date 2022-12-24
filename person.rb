require './nameable'

# Class Person
class Person < Nameable
  attr_accessor :name, :age, :rentals, :parent_permession
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permession: true)
    super()
    @id = Random.rand(1..9999)
    @name = name
    @age = age
    @parent_permession = parent_permession
    rentals = []
  end

  def add_rental(book, date)
    Rental.new(book, self, date)
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permession
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
