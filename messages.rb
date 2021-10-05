# frozen_string_literal: true

module Messages
  def setup
    [
      "Enter 'M' to play as the #{formatting('blue','CODEMAKER')}\nEnter 'B' to play as the #{formatting('red','CODEBREAKER')}",

      "\nEnter the number of guesses allowed by the codebreaker.\n('6','8','10', or '12')",

      "#{formatting('bg_black','  1  ')}  #{formatting('bg_red','  2  ')}  #{formatting('bg_green','  3  ')}  #{formatting('bg_yellow','  4  ')}  #{formatting('bg_blue','  5  ')}  #{formatting('bg_magenta','  6  ')}  #{formatting('bg_cyan','  7  ')}  #{formatting('reverse_color','  8  ')}",

      "\nAs the #{formatting('blue','CODEMAKER')} you will create the code. Enter your 4-digit code below using numbers 1-8.",

      "\nAs the #{formatting('red','CODEBREAKER')} you will try to break the code.",

      "\nMake a guess by entering a 4-digit code using numbers 1-8."
    ]
  end

  def ask_again
    [
      "#{formatting('red',"You must enter either 'M' to play as the CODEMAKER or 'B' to play as the CODEBREAKER")}",
      
      "#{formatting('red',"You must enter '6','8','10', or '12'.")}",

      "#{formatting('red',"You must enter 4-digits each from 1-8.")}"
    ]
  end

  def board_piece
    [
      "\n┏━━━━━━━━━━━━━━━━━━━━━━━━┓\n┃       MASTERMIND       ┃\n┣════════════════════════┫",
      "┗━━━━━━━━━━━━━━━━━━━━━━━━┛"
    ]
  end

  def dynamic_board(guess,feedback)
    "\n┃ #{guess[0]}  #{guess[1]}  #{guess[2]}  #{guess[3]}     #{feedback[0]} #{feedback[1]} #{feedback[2]} #{feedback[3]} ┃\n┣━━━━━━━━━━━━━━━━━━━━━━━━┫"
  end

  def codemaker_win(code)
    print "\n#{formatting('blue','CODEMAKER')} wins! The secret code was "
    puts "#{code[0]}  #{code[1]}  #{code[2]}  #{code[3]}"
  end

  def codebreaker_win
    puts "\n#{formatting('red','CODEBREAKER')} wins! They cracked the code!"
  end
end