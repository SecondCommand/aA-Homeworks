require_relative 'display'
require 'byebug'
class Simon
  COLORS = %w(red blue green yellow)
  COLOR_SYMBOLS = COLORS.map{|color|color.to_sym}

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
      @sequence_length = 1
      @game_over = false
      @seq = []
      @display = Display.new(COLOR_SYMBOLS)
  end

  def play
      until @game_over
          take_turn
      end
      game_over_message
      reset_game
  end

  def take_turn
      #SOME CHECKS MIGHT BE NEEDED
      show_sequence
      if correct_selection?(require_sequence)
          round_success_message
           @sequence_length += 1
      else
          game_over_message
          @game_over = true
      end
  end

  def show_sequence
      add_random_color
      @display.display_sequence(@seq.map{|color|color.to_sym})
  end

  def correct_selection?(bool)
      bool
  end

  def require_sequence
      true
      @display.acquire_check_answer(@seq.map{|color|color.to_sym})
      #ASKS FOR SEQUENCE
  end

  def add_random_color
      @seq << COLORS.sample
      @sequence_length = @seq.length
  end

  def round_success_message
      @display.success

  end

  def game_over_message
      @display.display_score(@seq.length)
      #debugger
  end

  def reset_game
      @sequence_length = 1
      @game_over = false
      @seq = []
      #@display.restart
      #debugger
      play
  end
end

Simon.new.play
