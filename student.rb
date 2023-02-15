require_relative './person'

# Blueprint for Student objects
class Student < Person
  attr_accessor: classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, parent_permission, name)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.animals.push(self) unless classroom.animals.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
