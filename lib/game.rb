require_relative 'player'
require_relative 'computer'
require_relative 'instruction'

class Game
  attr_reader :player, :computer

  include Instruction

  def initialize(player, computer)
    @player = player
    @computer = computer
  end

  def play
    # Instruction.display

    @secret_code = determine_secret_code
    p @secret_code
    # Game loop
    
    guess = player.make_guess
    feedback = provide_feedback(guess)
    puts "Correct Positions: #{feedback[0]} | Correct Digits: #{feedback[1]}"

  end

  private

  def determine_secret_code
    if @player.role == :code_maker
      @player.generate_code
    else
      @computer.generate_code
    end
  end

  def provide_feedback(guess)
    correct_positions = 0
    correct_digits = 0

    guess.each_with_index do |digit, index|
      if digit == @secret_code[index]
        correct_positions += 1
      elsif @secret_code.include?(digit)
        correct_digits += 1
      end
    end

    [correct_positions, correct_digits]
  end
end
