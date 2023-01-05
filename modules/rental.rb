require 'json'
require_relative './rental'

module PreserveRental
  FILE_NAME = "./database/rental.json"

  def create_rental_class(arr)
    new_arr = []
    arr.each do |el|
      new_arr << Rental.new(el["book"], el["person"], el["date"])
    end

    return new_arr
  end

  private :create_book_class

  # we need to open the file
  def fetch_rental
    File.new("#{FILE_NAME}", "w") unless File.exists?(FILE_NAME)
    file = File.read(FILE_NAME)
    data = (file.empty?)? [] : JSON.parse(file)
    return create_rental_class(data)
  end

  # we can write to the file
  def preserve_rentals(data)
    new_data = []
    data.each do |d|
      new_data << {
        book: d.book,
        person: d.person,
        date: d.date
      }
    end
    File.write(FILE_NAME, JSON.generate(new_data))
  end
end
