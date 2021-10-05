# frozen_string_literal: true

require './display.rb'

module GameInstructions
  include TextFormat

  def instructions
    puts <<~HEREDOC

      #{formatting('underline','WELCOME TO MASTERMIND')}

      Mastermind is a code-breaking game for two players. 
      One player becomes the #{formatting('blue','CODEMAKER')}, the other the #{formatting('red','CODEBREAKER')}.

      #{formatting('underline','The Setup')}

      The codemaker chooses a pattern of four #{formatting('underline','code pegs')}.
      The codebreaker tries to guess the pattern, in both order and color, within (usually) 12 turns.

      There are 8 colored code pegs...
      #{formatting('black','⬤')}  #{formatting('red','⬤')}  #{formatting('green','⬤')}  #{formatting('yellow','⬤')}  #{formatting('blue','⬤')}  #{formatting('magenta','⬤')}  #{formatting('cyan','⬤')}  #{formatting('gray','⬤')}
      
      And the codemaker can use any combination, including duplicates, when making the pattern.

      #{formatting('underline','The Game')}

      The codebreaker makes guesses by selecting a row of 4 code pegs.
      Once placed, the codemaker provides feedback by placing from zero to four #{formatting('underline','key pegs')} beside the row with the guess.

      #{formatting('red','●')} indicates a code peg guess that is correct in both color and position. 
      
      ● indicates the existence of a correct color code peg placed in the wrong position.

      Guesses and feedback continue until either the codebreaker guesses correctly or runs out of guesses.

      #{formatting('underline','Example')}

      Let's say the codemaker has created this pattern...
      #{formatting('green','⬤')}  #{formatting('blue','⬤')}  #{formatting('red','⬤')}  #{formatting('magenta','⬤')}

      Here is how a completed game board would look with the codebreaker guessing on the left and the codemaker providing feedback on the right:

      ┏━━━━━━━━━━━━━━━━━━━━━━━━┓
      ┃       MASTERMIND       ┃
      ┣════════════════════════┫
      ┃ #{formatting('yellow','⬤')}  #{formatting('yellow','⬤')}  #{formatting('blue','⬤')}  #{formatting('blue','⬤')}     ● ○ ○ ○ ┃
      ┣━━━━━━━━━━━━━━━━━━━━━━━━┫
      ┃ #{formatting('magenta','⬤')}  #{formatting('red','⬤')}  #{formatting('red','⬤')}  #{formatting('yellow','⬤')}     #{formatting('red','●')} ● ○ ○ ┃
      ┣━━━━━━━━━━━━━━━━━━━━━━━━┫
      ┃ #{formatting('green','⬤')}  #{formatting('magenta','⬤')}  #{formatting('green','⬤')}  #{formatting('yellow','⬤')}     #{formatting('red','●')} ● ○ ○ ┃
      ┣━━━━━━━━━━━━━━━━━━━━━━━━┫
      ┃ #{formatting('red','⬤')}  #{formatting('red','⬤')}  #{formatting('magenta','⬤')}  #{formatting('yellow','⬤')}     ● ○ ○ ○ ┃
      ┣━━━━━━━━━━━━━━━━━━━━━━━━┫
      ┃ #{formatting('blue','⬤')}  #{formatting('red','⬤')}  #{formatting('green','⬤')}  #{formatting('magenta','⬤')}     #{formatting('red','●')} ● ● ● ┃
      ┣━━━━━━━━━━━━━━━━━━━━━━━━┫
      ┃ #{formatting('green','⬤')}  #{formatting('blue','⬤')}  #{formatting('red','⬤')}  #{formatting('magenta','⬤')}     #{formatting('red','●')} #{formatting('red','●')} #{formatting('red','●')} #{formatting('red','●')} ┃
      ┣━━━━━━━━━━━━━━━━━━━━━━━━┫
      ┗━━━━━━━━━━━━━━━━━━━━━━━━┛

      #{formatting('italic','Codebreaker wins!')} The pattern was guessed in 6 moves.

      #{formatting('underline','How to Play')}

      This version of Mastermind is played in the command line.

      ...
        
    HEREDOC
  end
end