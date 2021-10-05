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

  protected

  def integer?(string)
    string.to_i.to_s == string
  end

  def zero_nine(number)
    return true if number.include?('0') || number.include?('9')
  end
end

# Takes the numberic guess, processes and prints matching board to screen
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

  # player is codebreaker
  def player_breaker(board, rounds, answer)
    winner = false
    while !winner && rounds.positive?
      guess = player_guess
      feedback = check_guess(guess, answer)
      puts board += make_board(guess, feedback)
      winner = feedback == win
      rounds -= 1
    end
    puts board_piece[1]
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
    exact = match(key_pegs, guess, temp_answer)
    key_pegs = partial_match(exact[0], guess, exact[1])
    add_blanks(key_pegs)
  end

  # add red key peg on perfect match, return modified answer key to avoid duplicates
  def match(keys, guess_array, answer_array)
    element = 0
    guess_array.each do |guess|
      if guess == answer_array[element]
        keys.push(formatting('red', '●').to_s)
        answer_array[element] = nil
      end
      element += 1
    end
    [keys, answer_array]
  end

  # add white key peg on partial match
  def partial_match(keys, guess_array, answer_array)
    element = 0
    guess_array.each do |guess|
      keys.push('●') if answer_array.include?(guess)
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
