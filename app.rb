require_relative './book.rb'
require_relative './classroom.rb'
require_relative './student.rb'

class App
  def initialize
    @books = []
    @people = []
    @classroom = nil
  end

  def create_book
    puts "Title?"
    title = gets.chomp
    puts "Author"
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
  end

  def create_person
    puts "Create a student (1) or teacher (2)?"
    answer = gets.chomp
    if answer == 1
        puts "Name: "
        name = gets.chomp
        puts "Age: "
        age = gets.chomp
        puts "Has parent permission[y/n]?: "
        permA = gets.chomp

        permission = false
        permission = true if permA == 's'

        @classroom = Classroom.new('Class A') if @classroom == nil
        stu = Student.new(age, @classroom, name, permission)

        @people << stu
    elseif 

    end
  end
end
