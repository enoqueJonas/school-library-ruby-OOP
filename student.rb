require_relative './person'

# Blueprint for Student objects
class Student < Person
  attr_accessor: classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, parent_permission, name)
    @classroom = classroom
  end

  def owner=(owner)
    @owner = owner
    owner.animals.push(self) unless owner.animals.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
