require "./nameable.rb"

# Class Person
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permession: true)
    @id = Random.rand(1..9999)
    @name = name
    @age = age
    @parent_permession = parent_permession
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
capitalizedPerson = Capitalize_Decorator.new(person)
puts capitalizedPerson.correct_name
capitalizedTrimmedPerson = Trimmer_Decorator.new(capitalizedPerson)
puts capitalizedTrimmedPerson.correct_name
