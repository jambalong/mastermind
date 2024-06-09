class Solver
  attr_reader :possible_solutions, :unused_codes, :max_guesses, :secret_code

  def initialize(possible_solutions, max_guesses, secret_code)
    @possible_solutions = possible_solutions
    @unused_codes = possible_solutions.dup # Create a copy of possible solutions for tracking unused codes
    @max_guesses = max_guesses
    @secret_code = secret_code
  end

  # Implementation of Mastermind solving algorithm
  # https://puzzling.stackexchange.com/questions/546/clever-ways-to-solve-mastermind
  def solve
    guess_count = 0

    loop do
      # Generate a guess using the minimax algorithm or a random guess if no scores available
      guess = guess_count.zero? ? 1122 : generate_guess

      puts "\nComputer Guess: #{guess}"
      feedback = receive_feedback(guess)

      puts "Correct Positions: #{feedback[0]} | Correct Digits: #{feedback[1]}"

      # Update possible solutions and unused codes based on feedback
      update_possible_solutions(guess, feedback)
      update_unused_codes(guess, feedback)
      guess_count += 1

      # Check if the code is broken or maximum guesses reached
      if code_broken?(feedback)
        puts "\nCongratulations! Code broken."
        break
      elsif guess_count >= max_guesses
        puts "\nMaximum number of guesses reached. Code not broken."
        break
      end
    end
  end

  private

  def generate_guess
    # Implement minimax algorithm to generate the next guess
    # Calculate the score for each possible guess and select the one with the maximum score

    scores = {}

    possible_solutions.each do |guess|
      scores[guess] = calculate_score(guess)
    end

    # Edge case: solver can't find a best next guess (scores.empty?), return random Integer
    if scores.nil? || scores.empty?
      return random_guess
    end

    best_guess = scores.max_by { |_guess, score| score }.first
    best_guess
  end

  def calculate_score(guess)
    # Calculate the score for each possible guess
    possible_outcomes = {}

    unused_codes.each do |code|
      feedback = compute_feedback(code, guess)
      possible_outcomes[feedback] ||= []
      possible_outcomes[feedback] << code
    end

    min_max_scores = possible_outcomes.map do |feedback, codes|
      [feedback, unused_codes.size - codes.size]
    end

    min_max_scores.min_by { |_feedback, score| score }.last
  end

  def receive_feedback(guess)
    # Receive feedback from the code maker (automated but can be expanded to allow user input)
    correct_positions = 0
    correct_digits = 0

    guess_digits = guess.digits.reverse
    secret_code_digits = @secret_code.digits.reverse

    guess_digits.each_with_index do |digit, index|
      if digit == secret_code_digits[index]
        correct_positions += 1
      elsif secret_code_digits.include?(digit)
        correct_digits += 1
      end
    end

    [correct_positions, correct_digits]
    # [2, 1] => Example feedback (e.g., 2 correct digits in correct position, 1 correct digit in wrong position)
  end

  def update_possible_solutions(guess, feedback)
    # Update unused codes based on feedback
    possible_solutions.select! do |solution|
      compute_feedback(solution, guess) == feedback
    end
  end

  def update_unused_codes(guess, feedback)
    # Update possible solutions based on feedback
    unused_codes.reject! do |code|
      compute_feedback(code, guess) != feedback
    end
  end

  def code_broken?(feedback)
    # Check if the code is broken (all digits in correct position)
    feedback == [4, 0]
  end

  def compute_feedback(code, guess)
    # Compute feedback (correct positions and correct digits) between code and guess
    correct_positions = 0
    correct_digits = 0

    guess_digits = guess.digits.reverse
    code_digits = code.digits.reverse

    guess_digits.each_with_index do |digit, index|
      if digit == code_digits[index]
        correct_positions += 1
      elsif code_digits.include?(digit)
        correct_digits += 1
      end
    end

    [correct_positions, correct_digits]
  end

  def random_guess
    number = ""
    4.times do
      number += rand(1..6).to_s
    end
    number.to_i
  end
end
