require_relative './person'

# Blueprint for Student objects
class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown')
    super(age, name)
    @classroom = classroom
    classroom.students << self
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
