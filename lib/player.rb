class Player
  attr_accessor :role, :code
  
  def initialize(role)
    @role = role
    @code = nil
  end

  def generate_code
    loop do
      puts "Enter your secret code ('1234'):"
      input = gets.chomp

      if valid_input?(input)
        @code = input.chars.map(&:to_i)
      end
      
      puts "Invalid input. Please enter a 4-digit code with digits between 1 and 6."
    end
  end

  def valid_input?(input)
    input.length == 4 && input.match?(/\A\d{4}\z/)
  end

  def make_guess
    # Prompt the player to make a guess and return it
    loop do
      puts "Enter your guess ('1234'):"
      input = gets.chomp

      if valid_input?(input)
        guess = input.chars.map(&:to_i)
        return guess
      end
      
      puts "Invalid input. Please enter a 4-digit code with digits between 1 and 6."
    end
  end
end
