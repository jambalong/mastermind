class Player
  attr_accessor :role
  
  def initialize(role)
    @role = role
  end

  def generate_code
    # Refactor
  end

  def valid_input?(input)
    return false unless input.is_a?(Integer)
    return false unless input.digits.count == 4
    true
  end

  def make_guess
    # Prompt the player to make a guess and return it
    loop do
      puts "Enter your guess ('1234'):"
      input = gets.chomp.to_i

      if valid_input?(input)
        guess = input
        puts "I guess #{guess}"
        return guess
      end
      
      puts "Invalid input. Please enter a 4-digit code with digits between 1 and 6."
    end
  end
end
