require_relative 'player'
require_relative 'computer'
require_relative 'solver'

# Contains the main game logic
class Game
  attr_accessor :max_guesses
  attr_reader :player, :computer, :secret_code

  def initialize
    @player = Player.new(get_role)
    @computer = Computer.new(player.role == :code_maker ? :code_breaker : :code_maker)
    @secret_code = player.role == :code_maker ? player.generate_code : computer.generate_code
    @max_guesses = 12
  end

  def play
    system 'clear'
    puts "\nTry and guess my secret code!"
    
    # Start the game loop based on the player's role
    code_breaker? ? play_code_breaker : solve_secret_code
  end

  private

  def solve_secret_code
    possible_solutions = (1111..6666).select { |num| num.digits.all? { |digit| digit.between?(1, 6) } }
    Solver.new(possible_solutions, max_guesses, secret_code).solve
  end

  def play_code_breaker
    guess = nil

    loop do
      puts "\nNumber of guesses left: #{max_guesses}"

      guess = player.make_guess
      feedback = computer.provide_feedback(secret_code, guess)
      puts "Correct Positions: #{feedback[0]} | Correct Digits: #{feedback[1]}"
      self.max_guesses -= 1

      break if code_broken?(guess) || max_guesses.zero?
    end

    puts code_broken?(guess) ? "\nCongratulations! The code was broken." : "\nUnfortunate! The correct code was: #{secret_code}"
  end

  def code_breaker?
    player.role == :code_breaker
  end

  def get_role
    loop do
      puts "\nWould you like to be the [code_breaker] or the [code_maker]?"
      input = gets.chomp.downcase
      return input.to_sym if %w[code_breaker code_maker].include?(input)

      puts "\nInvalid input. Please enter 'code_breaker' or 'code_maker'."
    end
  end

  def code_broken?(guess)
    secret_code == guess
  end
end
