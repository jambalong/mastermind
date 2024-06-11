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
      return input.to_i if valid_code?(input)

      puts 'Invalid input. Please enter a 4-digit code with digits between 1 and 6 only.'
    end
  end

  def make_guess
    loop do
      puts "\nEnter your guess ('1234'):"
      input = gets.chomp.to_i
      if valid_guess?(input)
        puts "\nYou guessed: #{input}"
        return input
      end

      puts "\nInvalid input. Please enter a 4-digit code with digits between 1 and 6."
    end
  end

  private

  def valid_code?(input)
    input.match?(/^\d{4}$/) && input.chars.all? { |digit| digit.to_i.between?(1, 6) }
  end

  def valid_guess?(input)
    input.is_a?(Integer) && input.digits.count == 4 && input.digits.all? { |digit| digit.between?(1, 6) }
  end
end
