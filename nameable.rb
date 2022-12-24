# Class Nameable
class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Class Decorator inhereting from Nameable
class Decorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

# Class CapitalizeDecorator inhereting from Decorator
class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

# Class TrimmerDecorator inhereting from Decorator
class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name[0..9]
  end
end
