class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class Decorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class Capitalize_Decorator < Decorator
  def correct_name
     @nameable.correct_name.split.map(&:capitalize).join(' ')
  end
end

class Trimmer_Decorator < Decorator
  def correct_name
     @nameable.correct_name.strip
  end
end
