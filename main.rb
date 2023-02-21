#!/usr/bin/env ruby

require './person'
require './decorators/captilized_decorator'
require './decorators/trim_decorator'
require_relative './app'
require_relative './files_manager.rb'

@app = App.new
@f_manage = FileManage.new

def menu_text
  puts "Please choose an option by entering a number: \n
    1 - List all books \n
    2 - List all people \n
    3 - Create a person \n
    4 - Create a book \n
    5 - Create a rental \n
    6 - List all rentals for a given person \n
    7 - Exit
"
end

def menu(option)
  case option
  when '1'
    puts @app.list_books
  when '2'
    @app.list_people
  when '3'
    @app.create_person
  when '4'
    @app.create_book
  when '5'
    @app.create_rental
  when '6'
    puts 'Type ID of person: '
    id = gets.chomp
    @app.list_rentals(id.to_i)
  when '7'
    # books_arr = []
    # people_arr = []
    # rentals_arr = []
    # @app.books.each do |book|
    #   obj = {
    #     :title => book.title,
    #     :author => book.author
    #   }
    #   books_arr << obj
    # end

    # @app.rentals.each do |rental|
    #   obj = {
    #     :book_title => rental.book.title,
    #     :person => rental.person.name,
    #     :date => rental.date
    #   }
    #   rentals_arr << obj
    # end

    # @app.people.each do |person|
    #   obj = {
    #     :name => person.name,
    #     :age => person.age
    #   }
    #   people_arr << obj
    # end    

    # @f_manage.write_on_file(Rental.file_name, @app.rentals)
    @f_manage.write_on_file(Book.file_name, @app.books)
    # @f_manage.write_on_file(Person.file_name, @app.people)
  end
end

def main
  # @app.rentals <<  @f_manage.read_file(Rental.file_name)
  # @f_manage.read_file(Book.file_name)
  # @app.add_people_from_file(@f_manage.read_file(Person.file_name))
  @app.add_books_from_file(@f_manage.read_file(Book.file_name))
  menu_option = ''
  while menu_option != '7'
    menu_text
    menu_option = gets.chomp
    menu(menu_option)
  end
  puts 'Thank you for using our software!'
end

main
