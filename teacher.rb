# frozen_string_literal: true

require './person'

# Class Teacher inhereting from Person Class
class Teacher < Person
  def initialize(age, specialization, name = 'Unknown')
    super(age, name, true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end