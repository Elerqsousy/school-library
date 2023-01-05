require 'json'
require './teacher'
require './student'
require './modules/rental'

module PreservePeople
  include PreserveRental
  FILE_NAME = "./database/people.json"

  def create_people_class(arr)
    new_arr = []
    arr.each do |el|
      el["type"] == 'Teacher' ? new_arr << {type: 'Teacher', data: Teacher.new(el["data"]["age"], el["data"]["name"], el["data"]["specialization"])} : new_arr << {type: 'Student', data: Student.new(el["data"]["age"], el["data"]["name"], el["data"]["parent_permission"])}
    end
    new_arr
  end

  private :create_people_class

  # we need to open the file
  def fetch_poeple
    File.new("#{FILE_NAME}", "w") unless File.exists?(FILE_NAME)
    file = File.read(FILE_NAME)
    data = (file.empty?)? [] : JSON.parse(file)
    return create_people_class(data)
  end

  # we can write to the file
  def preserve_people(people, books)
    new_data = []
    rentals_data = []
    people.each_with_index do |d, i|
      new_data << {
        type: d[:type],
        data: {
          name: d[:data].name,
          age: d[:data].age,
          parent_permission: d[:data].parent_permission,
          specialization: d[:type] == "Teacher" ? d[:data].specialization : nil,
        }
      }
      d[:data].rentals.each do |rental|
        rentals_data << {
          book_id: books.find_index(rental.book),
          date: rental.date,
          person_id: i
        }
      end
    end

    preserve_rentals(rentals_data)
    File.write(FILE_NAME, JSON.generate(new_data))
  end
end
