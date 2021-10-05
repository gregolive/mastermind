# frozen_string_literal: true

require './computer.rb'
require './display.rb'
require './instructions.rb'
require './logic.rb'
require './messages.rb'

# Start a game of Mastermind
class Game
  include GameLogic
  include GameInstructions
  include ComputerPlayer
  include Messages
  attr_reader :player, :rounds

  MODES = ["M","B"]
  ROUNDS = ["6","8","10","12"]

  def initialize
    @player = MODES[0]
    @rounds = 12
    @board = board_piece[0]
  end

  def start
    instructions
    intro
    @player == "M" ? maker : breaker
  end

  protected

  def intro
    puts setup[0] # ask whether maker or breaker
    @player = accepted_input(MODES, ask_again[0])
    puts setup[1] # ask number of guesses
    @rounds = accepted_input(ROUNDS, ask_again[1]).to_i
  end

  # player is codebreaker
  def breaker
    puts setup[4]
    secret_code = random_pattern
    winner = player_breaker(@board,@rounds,secret_code)
    winner ? codebreaker_win : codemaker_win(convert_code(secret_code))
  end

  # player is codemaker
  def maker
    puts setup[3]
  end
end