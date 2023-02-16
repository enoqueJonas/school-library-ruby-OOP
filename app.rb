require_relative './book.rb'
require_relative './classroom.rb'
require_relative './student.rb'
require_relative './rental.rb'

class App
  def initialize
    @books = []
    @people = []
    @classroom = nil
    @rentals = []
  end

  def create_book
    puts "Title?"
    title = gets.chomp
    puts "Author"
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts "Book created succesfully"
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
        puts "Student created succesfully"
    elseif answer == 2
        puts "Name: "
        name = gets.chomp
        puts "Age: "
        age = gets.chomp
        puts "Specialization:  "
        teacher = Teacher.new(age, specialization, name)
        @people << teacher
        puts "Teacher created succesfully"
    else
        puts "Invalid choice"
        create_person()
    end
  end

  def list_books
    @books.each_with_index do |book, index|
      puts "#{index}) #{book}"
    end
  end

  def list_people
    @people.each_with_index do |person, index|
      puts "#{index}) #{person}"
    end
  end

  def list_rentals(id)
    @rentals.each_with_index do |rental|
      puts "#{index}) #{rental}" if id == rental.person.id
    end
  end

  def create_rental
    puts "Select a book from the following by number (not id): "
    list_books()
    book_nr = gets.chomp
    book = @books[book_nr]
    puts "Select a person from the following by number (not id): "
    list_people()
    person_nr = gets.chomp
    person = @people[person_nr]
    puts "Date: "
    date = gets.chomp
    rental = Rental.new(date, book, person)
    @rentals << rental
    puts "Rental created succesfully"
  end
end
