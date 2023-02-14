require './person'
require './decorators/captilized_decorator'
require './decorators/trim_decorator'

person = Person.new(22, 'maximilianus')
p person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name
capitalized_trimmed_person = TrimDecorator.new(capitalized_person)
capitalized_trimmed_person.correct_name
