class Teacher < Person
    def(name="Unknown", age, parent_permission=true, specialization)
        super(name, age, parent_permission)
        @specialization = specialization
    end
end