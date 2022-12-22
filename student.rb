require './person'

# Class Student inhereting from Person Class
class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permession: true)
    super(age, name, parent_permession)
    @classroom = classroom
  end

  def play_hooky
    puts "¯\(ツ)/¯"
  end
end
