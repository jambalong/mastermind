class Computer
  attr_accessor :role

  def initialize(role)
    @role = role
  end

  def generate_code
    rand(1111..6666)
  end

  def provide_feedback(guess, secret_code)
    correct_positions = 0
    correct_digits = 0

    guess_digits = guess.digits.reverse
    secret_code_digits = secret_code.digits.reverse

    guess_digits.each_with_index do |digit, index|
      if digit == secret_code_digits[index]
        correct_positions += 1
      elsif secret_code_digits.include?(digit)
        correct_digits += 1
      end
    end

    [correct_positions, correct_digits]
  end
end
