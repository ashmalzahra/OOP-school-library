class Person
    def initialize(name = "Unknown", age, parent_permission = true)
        @id = id
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    attr_accessor :id

    attr_reader :name
    attr_writer :name 

    attr_reader :age
    attr_writer :age 

    def is_of_age?
        if @age >= 18? true : false
    end

    def can_use_services?
        if @age >= 18? true || parent_permission? true : false
    end

    private :is_of_age?
end
