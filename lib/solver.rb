# Contains the Mastermind Solver algorithm
class Solver
  attr_reader :possible_solutions, :unused_codes, :max_guesses, :secret_code

  def initialize(possible_solutions, max_guesses, secret_code)
    @possible_solutions = possible_solutions
    @unused_codes = possible_solutions.dup # Create a copy of possible solutions for tracking unused codes to be used later for optimization
    @max_guesses = max_guesses
    @secret_code = secret_code
  end

  # Implementation of Mastermind solving algorithm
  # https://puzzling.stackexchange.com/questions/546/clever-ways-to-solve-mastermind
  def solve
    guess_count = 0
    feedback = nil

    loop do
      guess = guess_count.zero? ? 1122 : generate_guess
      feedback = compute_feedback(secret_code, guess)

      puts "\nComputer Guess: #{guess}"
      puts "Correct Positions: #{feedback[0]} | Correct Digits: #{feedback[1]}"

      update_possible_solutions(guess, feedback)
      update_unused_codes(guess, feedback)
      guess_count += 1

      break if code_broken?(feedback) || guess_count >= max_guesses
    end

    puts code_broken?(feedback) ? "\nCongratulations! Code broken." : "\nMaximum number of guesses reached. Code not broken."
  end

  private

  def generate_guess
    scores = possible_solutions.map { |guess| [guess, calculate_score(guess)] }.to_h
    scores.empty? ? random_guess : scores.max_by { |_guess, score| score }.first
  end

  def calculate_score(guess)
    possible_outcomes = unused_codes.group_by { |code| compute_feedback(code, guess) }
    possible_outcomes.values.min_by { |codes| codes.size }.size
  end

  def update_possible_solutions(guess, feedback)
    possible_solutions.select! { |solution| compute_feedback(solution, guess) == feedback }
  end

  # I'm still debating how to use unused_codes to optimize algorithm
  def update_unused_codes(guess, feedback)
    unused_codes.reject! { |code| compute_feedback(code, guess) != feedback }
  end

  def code_broken?(feedback)
    feedback == [4, 0]
  end

  def compute_feedback(code, guess)
    correct_positions = guess.digits.each_with_index.count { |digit, index| digit == code.digits[index] }
    correct_digits = [guess.digits.uniq.count { |digit| code.digits.include?(digit) } - correct_positions, 0].max
  
    [correct_positions, correct_digits]
  end

  def random_guess
    4.times.map { rand(1..6) }.join.to_i
  end
end
