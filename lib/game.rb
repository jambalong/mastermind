require_relative 'player'
require_relative 'computer'
require_relative 'solver'

# Contains the main game logic
class Game
  attr_reader :player, :computer, :secret_code, :max_guesses

  def initialize
    # Create an instance of player with a role determined by user input
    @player = Player.new(get_role)
    # Create an instance computer with a role opposite to the player's role
    @computer = Computer.new(get_computer_role)
    # Determine the secret code based on the player's role
    @secret_code = determine_secret_code
    @max_guesses = 12
  end

  def play
    system 'clear'
    puts "\nTry and guess my secret code!"

    # Start the game loop based on the player's role
    code_breaker? ? play_code_breaker : play_code_maker
  end

  private

  def play_code_maker
    solve_secret_code
  end

  def solve_secret_code
    possible_solutions = generate_possible_solutions
    solver = Solver.new(possible_solutions, max_guesses, secret_code)
    solver.solve
  end

  # Generate possible solutions containing 4 digit Integer with digits between 1 and 6
  def generate_possible_solutions
    possible_solutions = []

    (1111..6666).each do |num|
      digits = num.digits.reverse
      possible_solutions << num if digits.all? { |digit| digit.between?(1, 6) }
    end

    possible_solutions
  end

  def play_code_breaker
    loop do
      puts "\nNumber of guesses left: #{max_guesses}"

      guess = player.make_guess
      feedback = computer.provide_feedback(guess, secret_code)
      puts "Correct Positions: #{feedback[0]} | Correct Digits: #{feedback[1]}"
      @max_guesses -= 1

      break if code_broken?(guess) || @max_guesses.zero?
    end

    if max_guesses.zero?
      puts "\nUnfortunate! The correct code was: #{secret_code}"
    else
      puts "\nCongratulations! The code was broken."
    end
  end

  def code_breaker?
    player.role == :code_breaker
  end

  # Get the player's role by input and return as symbol
  def get_role
    puts "\nWould you like to be the [code_breaker] or the [code_maker]?"
    input = gets.chomp.downcase

    until valid_role?(input)
      puts "\nInvalid input. Please enter 'code_breaker' or 'code_maker'."
      input = gets.chomp.downcase
    end

    input.to_sym
  end

  def valid_role?(input)
    %w[code_breaker code_maker].include?(input)
  end

  def determine_secret_code
    if player.role == :code_maker
      player.generate_code
    else
      computer.generate_code
    end
  end

  def get_computer_role
    player.role == :code_maker ? :code_breaker : :code_maker
  end

  def code_broken?(guess)
    secret_code == guess
  end
end
