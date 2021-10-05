# frozen_string_literal: true

module ComputerPlayer
  # computer codemaker creates array of string numbers
  def random_pattern
    pattern = []
    4.times { pattern.push(rand(1..8))}
    pattern.collect{|integer| integer.to_s}
  end

  # for computer codebreaker
end