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
    turns_left = 12

    loop do
      guess = player.make_guess
      feedback = provide_feedback(guess)
      puts "Correct Positions: #{feedback[0]} | Correct Digits: #{feedback[1]}"
      turns_left -= 1

      break if code_broken?(guess) || turns_left == 0
    end

    puts "Congratulations! The code was broken."
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

  def code_broken?(guess)
    @secret_code == guess
  end
end
