require 'byebug'

class ConsoleInterface
  def initialize(board, board_display)
    @board = board
    @board_display = board_display
  end

  def process_coordinates(coordinates, last_coordinates)
    same_cards = @board.compare_cards_in_coordinates(coordinates, last_coordinates)

    if same_cards
      puts("It's a match")
    else
      puts("Try again")
    end
    sleep(1)

    unless  same_cards
      @board.toggle_card_in_position(coordinates)
      @board.toggle_card_in_position(last_coordinates)
    end

  end

  def init
    last_coordinates = nil

    until @board.game_over
      self.display_board
      coordinates = get_coordinates
      @board.toggle_card_in_position(coordinates)
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

  def get_coordinates
    print("Enter a position (e.g 0,0): ")
    user_input = gets.chomp
    coordinates = user_input.split(",")
    coordinates.map(&:to_i)
  end

  private

  def display_board
    system("clear")
    @board_display.display_board(@board)
  end

end
