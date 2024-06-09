require_relative 'player'
require_relative 'computer'
require_relative 'instruction'

class Game
  include Instruction

  def initialize(player, computer)
    @player = player
    @computer = computer
  end

  def play
    Instruction.display

    @secret_code = determine_secret_code
    p @secret_code
    # Game loop
  end

  private

  def determine_secret_code
    if @player.role == :code_maker
      @player.generate_code
    else
      @computer.generate_code
    end
  end
end
