require 'byebug'

class ConsoleInterface
  def initialize(game, board_display)
    @game = game
    @board_display = board_display
  end

  def process_coordinates(coordinates, last_coordinates)
    same_cards = @game.compare_cards_in_coordinates(coordinates, last_coordinates)

    if same_cards
      puts("It's a match")
    else
      puts("Try again")
    end
    sleep(1)

    unless same_cards
      @game.toggle_card_in_position(coordinates)
      @game.toggle_card_in_position(last_coordinates)
    end

  end

  def init
    last_coordinates = nil

    until @game.game_over?
      self.display_board
      coordinates = @game.get_player_input
      @game.toggle_card_in_position(coordinates)
      self.display_board

      if last_coordinates == nil
        sleep(1)
        last_coordinates = coordinates
      else
        self.process_coordinates(coordinates, last_coordinates)
        last_coordinates = nil
      end
    end

    puts("Is out")
  end

  def display_board
    board = @game.board
    system("clear")
    @board_display.display_board(board)
  end

end
