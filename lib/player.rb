# Player class for handling secret code input and guess inputs
class Player
  attr_accessor :role

  def initialize(role)
    @role = role
  end

  def generate_code
    loop do
      puts "\nEnter your secret code (4 digits between 1 and 6):"
      input = gets.chomp

      # Check if input is 4 digits and contains digits between 1 and 6 only
      return input.to_i if input.match?(/^\d{4}$/) && input.chars.all? { |digit| digit.to_i.between?(1, 6) }

      puts 'Invalid input. Please enter a 4-digit code with digits between 1 and 6 only.'
    end
  end

  def valid_input?(input)
    return false unless input.is_a?(Integer)
    return false unless input.digits.count == 4

    true
  end

  def make_guess
    # Prompt the player to make a valid guess and return it
    loop do
      puts "\nEnter your guess ('1234'):"
      input = gets.chomp.to_i

      if valid_input?(input)
        guess = input
        puts "\nYou guessed: #{guess}"
        return guess
      end

      puts "\nInvalid input. Please enter a 4-digit code with digits between 1 and 6."
    end
  end
end
