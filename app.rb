require_relative './book'
require_relative './classroom'
require_relative './student'
require_relative './rental'
require_relative './teacher'

class App
  attr_reader :books, :people, :rentals
  def initialize
    @books = []
    @people = []
    @classroom = nil
    @rentals = []
  end

  def create_book
    puts 'Title?'
    title = gets.chomp
    puts 'Author'
    author = gets.chomp
    @books << {
      :title => title,
      :author => author
    }
    puts 'Book created succesfully'
  end

  def create_student
    puts 'Name: '
    name = gets.chomp
    puts 'Age: '
    age = gets.chomp
    puts 'Has parent permission[y/n]?: '
    gets.chomp
    @classroom = Classroom.new('Class A') if @classroom.nil?
    stu = Student.new(age, @classroom, name)
    @people << {
      :id => stu.id,
      :type => "Student",
      :age => age,
      :classroom =>  @classroom,
      :name => name
    }
    puts 'Student created succesfully'
  end

  def create_teacher
    puts 'Name: '
    name = gets.chomp
    puts 'Age: '
    age = gets.chomp
    puts 'Specialization:  '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people << {
      :id => teacher.id,
      :type => "Teacher",
      :age => age,
      :specialization => specialization,
      :name => name
    }
    puts 'Teacher created succesfully'
  end

  def create_person
    puts 'Create a student (1) or teacher (2)?'
    answer = gets.chomp
    case answer
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid choice'
      create_person
    end
  end

  def list_books
    str = ''
    @books.each_with_index do |book, index|
      str += "#{index}) Title: #{book[:title]}, Author: #{book[:author]} \n"
    end
    str
  end

  def add_people_from_file(p_arr = [])
    @people = @people + p_arr if p_arr != []
  end

  def add_books_from_file(arr = [])
    @books = @books + arr if arr != []
  end

  def add_rentals_from_file(arr = [])
    @rentals = @rentals + arr if arr != []
  end

  def list_people
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person[:type]}] Name: #{person[:name]}, ID: #{person[:id]}, Age: #{person[:age]}"
    end
  end

  def list_rentals(id)
    puts "ID of person: #{id}
    Rentals: \n"
    @rentals.each do |rental|
      next unless id == rental[:person][:id]

      puts "Date: #{rental[:date]}, Book: #{rental[:book][:title]} by #{rental[:book][:author]}"
    end
  end

  def create_rental
    puts 'Select a book from the following by number (not id): '
    puts list_books
    book_nr = gets.chomp
    book = @books[book_nr.to_i]
    puts 'Select a person from the following by number (not id): '
    list_people
    person_nr = gets.chomp
    person = @people[person_nr.to_i]
    puts 'Date: '
    date = gets.chomp
    @rentals << {
      :date => date,
      :book => book,
      :person => person
    }
    puts 'Rental created succesfully'
  end
end
