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
    puts "Enter"
    @f_manage.write_on_file(Rental.file_name, @app.rentals)
    @f_manage.write_on_file(Book.file_name, @app.books)
    @f_manage.write_on_file(Person.file_name, @app.people)
  end
end

def main
  menu_option = ''
  while menu_option != '7'
    menu_text
    menu_option = gets.chomp
    menu(menu_option)
  end
  puts 'Thank you for using our software!'
end

main
