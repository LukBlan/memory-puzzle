require 'byebug'

class ConsoleInterface
  def initialize(board, board_display)
    @board = board
    @board_display = board_display
  end

  def init
    last_coordinates = nil
    until @board.game_over
      @board_display.display_board(@board)
      coordinates = get_coordinates

      if last_coordinates == nil
        @board.toggle_card_in_position(coordinates)
        last_coordinates = coordinates
      else
        @board.check_cards_in_positions(coordinates, last_coordinates)
        last_coordinates = nil
      end
    end

    puts("Is out")
  end

  def get_coordinates
    print("Enter a position (e.g 0,0): ")
    user_input = gets.chomp
    coordinates = user_input.split(",")
    coordinates.map(&:to_i)
  end

end
