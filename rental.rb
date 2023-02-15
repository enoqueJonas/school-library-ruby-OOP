class Rental
    attr_accessor :date, :book

    def initialize(date)
        @date = date
    end

    def book=(book)
        @book = book
        book.rentals.push(self) unless book.rentals.include?(self)
    end
end