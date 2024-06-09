require_relative 'player'
require_relative 'computer'
require_relative 'instruction'

class Game
  attr_reader :player, :computer, :secret_code

  include Instruction

  def initialize
    @player = Player.new(get_role)
    @computer = Computer.new(get_computer_role)
    @secret_code = determine_secret_code
  end

  def play
    # Instruction.display
    p @secret_code

    # Game loop
    code_breaker? ? play_code_breaker : play_code_maker
    
  end

  private

  def play_code_maker
    puts "I am code maker"
  end

  def play_code_breaker
    puts "I am code breaking"
    turns_left = 12

    loop do
      guess = player.make_guess
      feedback = computer.provide_feedback(guess, @secret_code)
      puts "Correct Positions: #{feedback[0]} | Correct Digits: #{feedback[1]}"
      turns_left -= 1

      break if code_broken?(guess) || turns_left == 0
    end

    puts "Congratulations! The code was broken."
  end

  
  def code_breaker?
    @player.role == :code_breaker
  end

  def get_role
    puts "Would you like to be the [code_breaker] or the [code_maker]?"
    input = gets.chomp.downcase

    until valid_role?(input)
      puts "Invalid input. Please enter 'code_breaker' or 'code_maker'."
      input = gets.chomp.downcase
    end

    input.to_sym
  end

  def valid_role?(input)
    input == "code_breaker" || input == "code_maker"
  end

  def determine_secret_code
    if @player.role == :code_maker
      @player.generate_code
    else
      @computer.generate_code
    end
  end
  
  def get_computer_role
    @player.role == :code_maker ? :code_breaker : :code_maker
  end

  def code_broken?(guess)
    @secret_code == guess
  end
end
