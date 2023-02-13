# Blueprint for Person objects
class Person
    attr_accessor :name, :age
    attr_reader :id

    def initialize(name="Unknown", age, parent_permission=true)
        @id = Random.rand(0...1000)
        @name = name
        @age = age
    end

    def is_of_age?
        return true if @age >= 18
        false
    end

    def can_use_services?
        if(is_of_age? || parent_permission)
            true
        end
        false
    end
    private :is_of_age?
end