# frozen_string_literal: true

# Logic for computer as codemaker and breaker
module ComputerPlayer
  # computer codemaker creates array of string numbers
  def random_pattern
    pattern = []
    4.times { pattern.push(rand(1..8)) }
    pattern.collect(&:to_s)
  end

  # for computer codebreaker
end
