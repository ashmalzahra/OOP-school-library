
class Nameable
  def correct_name
    raise NotImplementedError
  end
end


class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || parent_permission == true
  end

  def correct_name
    name
  end

  private :of_age?
end

class Decorator < Nameable
  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
   if (@nameable.correct_name.length > 10) @nameable.correct_name.trim
  end
end
