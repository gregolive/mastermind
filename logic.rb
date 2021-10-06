# frozen_string_literal: true

require './messages'
require './display'

# Process player input
module InputLogic
  # general input
  def accepted_input(array, string)
    input = gets.chomp
    while array.include?(input) == false
      puts string
      input = gets.chomp
    end
    input
  end

  # input player 4 digit code
  def code_input(string)
    input = gets.chomp
    while input.length != 4 || !integer?(input) || zero_nine(input)
      puts string
      input = gets.chomp
    end
    input
  end

  def integer?(string)
    string.to_i.to_s == string
  end

  def zero_nine(number)
    return true if number.include?('0') || number.include?('9')
  end
end

# All methods for when player is codebreaker
module GameLogic
  include InputLogic
  include Messages
  include TextFormat

  # for numbered code into color code
  def colors
    {
      '1' => formatting('black', '⬤').to_s,
      '2' => formatting('red', '⬤').to_s,
      '3' => formatting('green', '⬤').to_s,
      '4' => formatting('yellow', '⬤').to_s,
      '5' => formatting('blue', '⬤').to_s,
      '6' => formatting('magenta', '⬤').to_s,
      '7' => formatting('cyan', '⬤').to_s,
      '8' => formatting('gray', '⬤').to_s
    }
  end

  # feedback array generated in win condition
  def win
    [
      formatting('red', '●'),
      formatting('red', '●'),
      formatting('red', '●'),
      formatting('red', '●')
    ]
  end

  def random_pattern
    pattern = []
    4.times { pattern.push(rand(1..8)) }
    pattern.collect(&:to_s)
  end

  def player_breaker(board, rounds, answer)
    winner = false
    while !winner && rounds.positive?
      guess = player_guess
      feedback = check_guess(guess, answer)
      print board += make_board(guess, feedback)
      winner = feedback == win
      rounds -= 1
    end
    print board_piece[1]
    winner
  end

  # get codebreaker pattern guess as an array
  def player_guess
    puts setup[5]
    puts setup[2]
    code_input(ask_again[2]).split(//)
  end

  # provide feedback on guess
  def check_guess(guess, answer)
    key_pegs = []
    temp_answer = answer.dup # that can be modified
    temp_guess = guess.dup
    exact = match(key_pegs, temp_guess, temp_answer)
    key_pegs = partial_match(exact[0], exact[1], exact[2])
    add_blanks(key_pegs)
  end

  # add red key peg on perfect match, return modified answer key to avoid duplicates
  def match(keys, guess_array, answer_array)
    element = 0
    guess_array.each do |guess|
      if guess == answer_array[element]
        keys.push(formatting('red', '●').to_s)
        answer_array[element] = nil
        guess_array[element] = nil
      end
      element += 1
    end
    [keys, guess_array, answer_array]
  end

  # add white key peg on partial match
  def partial_match(keys, guess_array, answer_array)
    element = 0
    guess_array.each do |guess|
      next if guess.nil?

      if answer_array.include?(guess)
        keys.push('●')
        answer_array[answer_array.index(guess)] = nil
      end
      element += 1
    end
    keys
  end

  # add miss key pegs for incorrect guesses
  def add_blanks(keys)
    misses = 4 - keys.length
    misses.times { keys.push('○') }
    keys
  end

  # add guess and feedback to the game board
  def make_board(guess, feedback)
    colored_code = convert_code(guess)
    dynamic_board(colored_code, feedback)
  end

  # convert numbered code for colored display
  def convert_code(number_code)
    number_code.map! { |number| colors[number] }
  end
end

# All methods for when computer is codebreaker
module ComputerLogic
  include GameLogic

  def display_code(code)
    colored_code = convert_code(code)
    show_code(colored_code)
  end

  def computer_breaker(rounds, player_code)
    winner = false
    print board_piece[0]
    while !winner && rounds.positive?
      winner = computer_guess(player_code) == win
      rounds -= 1
    end
    print board_piece[1]
    winner
  end

  def computer_guess(player_code)
    guess = random_pattern
    feedback = check_guess(guess, player_code)
    print make_board(guess, feedback)
    sleep(0.75)
    feedback
  end
end
