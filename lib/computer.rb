class Computer
  attr_accessor :role

  def initialize(role)
    @role = role
  end

  def generate_code
    number = rand(1000..9999) # Generate a random 4-digit number
    number_str = number.to_s
  
    # Replace each digit with a random digit between 1 and 6
    number_str.each_char.with_index do |digit, index|
      new_digit = rand(1..6).to_s
      number_str[index] = new_digit
    end
  
    secret_code = number_str.to_i
  
    return secret_code
  end

  def provide_feedback(guess, secret_code)
    correct_positions = 0
    correct_digits = 0

    guess_digits = guess.digits.reverse
    secret_code_digits = secret_code.digits.reverse

    # Compare each digit of the guess with the corresponding digit of the secret code
    guess_digits.each_with_index do |digit, index|
      if digit == secret_code_digits[index]
        correct_positions += 1 # Check if the digit is in the correct position
      elsif secret_code_digits.include?(digit)
        correct_digits += 1 # Check if the digit is in the secret code but in the wrong position
      end
    end

    [correct_positions, correct_digits]
  end
end
