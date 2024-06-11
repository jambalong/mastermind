# Computer class to handle secret code generation and provide feedback
class Computer
  attr_accessor :role

  def initialize(role)
    @role = role
  end

  def generate_code
    4.times.map { rand(1..6) }.join.to_i
  end

  def provide_feedback(code, guess)
    correct_positions = guess.digits.each_with_index.count { |digit, index| digit == code.digits[index] }
    correct_digits = [guess.digits.uniq.count { |digit| code.digits.include?(digit) } - correct_positions, 0].max
  
    [correct_positions, correct_digits]
  end
end
