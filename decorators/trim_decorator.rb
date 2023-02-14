require './base_decorator'

class TrimDecorator < BaseDecorator
    def correct_name
        @nameable.correct_name.[0..10].gsub(/\s\w+$/,'...')
    end
end