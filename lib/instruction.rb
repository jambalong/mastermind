# Contains the instructions for Mastermind game and method to display it.
module Instruction
  def self.display
    puts <<~INSTRUCTIONS
      Mastermind Instructions:

      Objective:
        The goal of Mastermind is for one player, the code maker, to create a secret code,
        and for the other player, the code breaker, to guess the code within a certain number of turns.

      Setup:
        - The code maker (usually one player) selects a secret code consisting of a sequence of numbered pegs or numbers.
        - The code can will be 4 pegs. ('1234')
        - The numbers used in the code are usually chosen from a predefined set.#{' '}
        (between 1 and 6)

      Gameplay:
        - The code breaker (usually another player) begins by making a guess at what
        the secret code might be.
        - After each guess, the code maker provides feedback to the code breaker on#{' '}
        how close their guess was to the actual code.
        - The feedback usually consists of indicating how many pegs in the guess are#{' '}
        the correct number and in the correct position, and how many pegs are the#{' '}
        correct number but in the wrong position.
        - Based on this feedback, the code breaker makes subsequent guesses, refining#{' '}
        their strategy to deduce the secret code.

      Winning:
        - The code breaker wins the game if they guess the secret code within a certain#{' '}
        number of turns (12 turns).
        - If they don't guess the code within the allotted number of turns, the code maker wins.

      Variations:
        - Mastermind can be played with various rule variations, such as using different#{' '}
        numbers of numbers, allowing duplicate numbers in the code, changing the length#{' '}
        of the code, and adjusting the number of turns allowed for the code breaker.

        - This variation will allow duplicate numbers in the code. ('1111')

      Roles Reversal:
        - In this version of the game, players may switch roles between code maker and#{' '}
        code breaker after each game, allowing both players to experience both sides of the game.\n\n
    INSTRUCTIONS
  end
end
