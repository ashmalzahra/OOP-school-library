class Book 
    def initialize(title, author)
        @title = title
        @author = author
        @rental = []
    end
    
    attr_accessor :title, :author
    attr_reader :rental
end