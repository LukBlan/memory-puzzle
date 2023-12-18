require 'byebug'

class ConsoleInterface
  def initialize(game, board_display, console_formatter)
    @game = game
    @board_display = board_display
    @console_formatter = console_formatter
  end

  def init
    self.show_welcome_message
    puts
    self.show_count_down
    self.game_loop
    system("clear")
    self.show_game_over_message
  end



  def show_count_down
    start_seconds = 3
    print("Game start in ")

    start_seconds.times do
      print("#{start_seconds} ")
      sleep(1)
      start_seconds -= 1
    end

    print("Now!!")
  end

  def show_welcome_message
    @console_formatter.show_message_between_dashes("Welcome to Memory Puzzle")
  end

  def show_game_over_message
    @console_formatter.show_message_between_dashes("Game Over")
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

  def display_board
    board = @game.board
    system("clear")
    @board_display.display_board(board)
  end

  private

  def game_loop
    last_coordinates = nil

    until @game.game_over?
      self.display_board
      coordinates = @game.get_player_input(@console_formatter)
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
  end

end
