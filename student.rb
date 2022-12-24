require './person'

# Class Student inhereting from Person Class
class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permession: true)
    super(age, name, parent_permession)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    puts '(ツ)_/¯'
  end
end
