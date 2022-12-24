require './book'
require './student'
require './teacher'

class App
  attr_accessor :books, :people

  def initialize
    @books = []
    @people = []
  end

  def list_books(with_index)
    @books.each_with_index do |book, i|
      indexing = with_index? "#{(i + 1).to_s}) " : ''
      puts "#{indexing}title: #{book.title}, author: #{book.author}"
    end
  end

  def add_book(title, author)
    @books << Book.new(title, author)
  end

  def add_student(age, name, parent_permession)
    @people << {type: "Student", data: Student.new(age, name, parent_permession)}

  end

  def add_teacher(age, name, specialization)
    @people << {type: "Teacher", data: Teacher.new(age, name, specialization)}
  end

  def add_person(type)
    case type
    when(1)
      add_student
    when(2)
      add_teacher
    end
  end

  def list_people(with_index)
    @people.each_with_index do |person, i|
      indexing = with_index? "#{(i + 1).to_s})" : ''
      puts "#{indexing}[#{person.type}] id: #{person.data.id}, age: #{person.data.age}, name: #{person.data.name}"
    end
  end

  def create_rental(book_index, person_index, date)
    @books[book_index].add_rental(@people[person_index], date)
  end

  def find_person(person_id)
    @people.find {|person| person.data.id == person_id}
  end

  def list_person_rentals(id)
    person = find_person(id)
    person && person.data.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end
end
