class Computer
  attr_accessor :role, :code

  def initialize(role)
    @role = role
    @code = generate_code
  end

  def generate_code
    (1..4).map { rand(1..6) }
  end

  def make_guess
    # Logic for the computer to make a guess
  end

  def receive_feedback(feedback)
    # Display feedback to the computer
  end
  
end
