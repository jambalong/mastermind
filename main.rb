require_relative 'lib/game'
require_relative 'lib/instruction'

# Method to prompt the user if they want to view the instructions
def view_instructions
  puts "\nWould you like to view the instructions? (y/n)"

  loop do
    input = gets.chomp.downcase
    if input == 'y'
      system 'clear'
      Instruction.display # Display the game instructions

      break
    elsif input == 'n'
      puts "\nNo problem. Enjoy the game!"
      break
    else
      puts "\nInvalid input. Please enter 'y' or 'n'."
    end
  end
end

system 'clear'
puts 'Welcome to Masterind!'

view_instructions

game = Game.new
game.play
