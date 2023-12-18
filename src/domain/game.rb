class Game
  attr_reader :board

  def initialize(board, player)
    @board = board
    @player = player
  end

  def game_over?
    @board.game_over?
  end

  def compare_cards_in_coordinates(coordinates, last_coordinates)
    @board.compare_cards_in_coordinates(coordinates, last_coordinates)
  end

  def get_player_input(console_formatter)
    max_size = @board.get_size - 1
    @player.get_input(max_size, console_formatter)
  end

  def toggle_card_in_position(coordinates)
    @board.toggle_card_in_position(coordinates)
  end
end
