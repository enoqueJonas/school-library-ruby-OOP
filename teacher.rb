require_relative './person'

# Blueprint for Teacher objects
class Teacher < Person
  def initialize(age, specialization, name = 'Unknown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def self.file_name
    "people.json"
  end
end
