require_relative 'lib/game'
require_relative 'lib/instruction'

# Method to prompt the user if they want to view the instructions
def view_instructions
  puts "\nWould you like to view the instructions? (y/n)"

  loop do
    case gets.chomp.downcase
    when 'y'
      system 'clear'
      Instruction.display
      break
    when 'n'
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

Game.new.play
