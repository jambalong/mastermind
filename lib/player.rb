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

      if valid_code?(input)
        @code = input.chars.map(&:to_i)
        return @code
      end
      
      puts "Invalid input. Please enter a 4-digit code with digits between 1 and 6."
    end
  end

  def valid_code?(input)
    input.length == 4 && input.match?(/\A\d{4}\z/)
  end

  def make_guess
    # Prompt the player to make a guess and return it
    puts "Enter your guess:"
    gets.chomp.split('')
  end
end
