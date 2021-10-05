# frozen_string_literal: true

require './messages.rb'
require './display.rb'

# Process player input
module InputLogic
  # general input
  def accepted_input(array,string)
    input = gets.chomp
    while array.include?(input) == false
      puts string
      input = gets.chomp
    end
    return input
  end

  # input player 4 digit code
  def code_input(string)
    input = gets.chomp
    while input.length != 4 || !(is_integer(input)) || zero_nine(input)
      puts string
      input = gets.chomp
    end
    return input
  end

  protected

  def is_integer(string)
    string.to_i.to_s == string
  end

  def zero_nine(number)
    if number.include?("9") || number.include?("9")
      return true
    end
  end
end

module GameLogic
  include InputLogic
  include Messages
  include TextFormat
  
  # for numbered code into color code
  def colors
    {
    '1' => "#{formatting('black','⬤')}",
    '2' => "#{formatting('red','⬤')}",
    '3' => "#{formatting('green','⬤')}",
    '4' => "#{formatting('yellow','⬤')}",
    '5' => "#{formatting('blue','⬤')}",
    '6' => "#{formatting('magenta','⬤')}", 
    '7' => "#{formatting('cyan','⬤')}",
    '8' => "#{formatting('gray','⬤')}" 
    }
  end

  # feedback array generated in win condition
  def win
    [
      formatting('red','●'),
      formatting('red','●'),
      formatting('red','●'),
      formatting('red','●')
    ]
  end

  # player is codebreaker
  def player_breaker(board,rounds,answer)
    winner = false
    while (!winner && rounds > 0)
      guess = player_guess
      feedback = check_guess(guess,answer)
      puts board += make_board(guess,feedback)
      feedback == win ? winner = true : winner = false
      rounds -= 1
    end
    puts board_piece[1]
    return winner
  end

  # get codebreaker pattern guess as an array
  def player_guess
    puts setup[5]
    puts setup[2]
    code_input(ask_again[2]).split(//)
  end

  # provide feedback on guess
  def check_guess(guess,answer)
    key_pegs = []
    temp_answer = answer.dup # that can be modified
    exact = match(key_pegs,guess,temp_answer)
    key_pegs = partial_match(exact[0],guess,exact[1])
    add_blanks(key_pegs)
  end

  # add red key peg on perfect match, return modified answer key to avoid duplicates
  def match(keys,guess_array,answer_array)
    element = 0
    guess_array.each {|guess|
      if guess == answer_array[element]
        keys.push("#{formatting('red','●')}")
        answer_array[element] = nil
      end
      element += 1
    }
    return [keys, answer_array]
  end

  # add white key peg on partial match
  def partial_match(keys,guess_array,answer_array)
    element = 0
    guess_array.each {|guess|
      if answer_array.include?(guess)
        keys.push('●')
      end
      element += 1
    }
    keys
  end

  # add miss key pegs for incorrect guesses 
  def add_blanks(keys)
    misses = 4 - keys.length
    misses.times{ keys.push('○') }
    return keys
  end

  # add guess and feedback to the game board
  def make_board(guess,feedback)
    colored_code = convert_code(guess)
    dynamic_board(colored_code,feedback)
  end

  # convert numbered code for colored display 
  def convert_code(number_code)
    number_code.map! {|number| colors[number]}
  end
end