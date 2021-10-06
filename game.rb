# frozen_string_literal: true

require './display'
require './instructions'
require './logic'
require './messages'

# Start a game of Mastermind
class Game
  include GameLogic
  include ComputerLogic
  include GameInstructions
  include Messages
  attr_reader :player, :rounds

  MODES = %w[M B].freeze
  ROUNDS = %w[6 8 10 12].freeze

  def initialize
    @player = MODES[0]
    @rounds = 12
    @board = board_piece[0]
  end

  def start
    instructions
    intro
    @player == 'M' ? maker : breaker
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
    print setup[4]
    secret_code = random_pattern
    winner = player_breaker(@board, @rounds, secret_code)
    winner ? codebreaker_win : codemaker_win(convert_code(secret_code))
  end

  # player is codemaker
  def maker
    puts setup[3]
    puts setup[2]
    player_code = code_input(ask_again[2]).split(//)
    display_code(player_code.dup)
    winner = computer_breaker(@rounds, player_code)
    winner ? codebreaker_win : codemaker_win_basic
  end
end
