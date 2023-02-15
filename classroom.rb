class Classroom
    attr_accessor :label
    attr_reader :students

    def initialize(label)
        @label = label
        @students = []
    end

    def addStudent(student)
        @students.push(student)
    end
end