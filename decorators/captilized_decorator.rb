require './base_decorator'

class CapitalizedDecorator < BaseDecorator
    def correct_name
        @nameable.correct_name.upcase
end