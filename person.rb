# Class Person
class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permession: true)
    @id = Random.rand(1..9999)
    @name = name
    @age = age
    @parent_permession = parent_permession
  end

  def can_use_services?
    of_age? || @parent_permession
  end

  private

  def of_age?
    @age >= 18
  end
end
