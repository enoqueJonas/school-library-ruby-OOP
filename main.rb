require './person.rb'
require './decorators/captilized_decorator.rb'
require './decorators/trim_decorator.rb'

person = Person.new(22, 'maximilianus')
  person.correct_name
  capitalizedPerson = CapitalizeDecorator.new(person)
  p capitalizedPerson.correct_name
  p capitalizedTrimmedPerson = TrimDecorator.new(capitalizedPerson)
  p capitalizedTrimmedPerson.correct_name