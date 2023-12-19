class Game
  attr_reader :board

  def initialize(board, player)
    @board = board
    @player = player
    @last_guess = nil
    @actual_guess = nil
  end

  def game_over?
    @board.game_over?
  end

  def have_guess?
    @last_guess != nil
  end

  def compare_cards_in_coordinates(coordinates, last_coordinates)
    @board.compare_cards_in_coordinates(coordinates, last_coordinates)
  end

  def get_player_input(console_formatter)
    max_size = @board.get_size - 1
    @player.get_input(max_size, console_formatter)
  end

  def guess_card_in_position(coordinates)
    card = @board.get_card(coordinates)
    card.toggle
    @actual_guess = card
  end

  def first_guess?
    @last_guess == nil
  end

  def save_guess
    @last_guess = @actual_guess
  end

  def process_guess
    if self.match_guess

    else
      @actual_guess.toggle
      @last_guess.toggle
    end

    @actual_guess = nil
    @last_guess = nil
  end

  def match_guess
    @last_guess.eql?(@actual_guess)
  end
end
