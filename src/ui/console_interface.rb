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

  def game_loop
    until @game.game_over?
      self.display_board
      coordinates = @game.get_player_input(@console_formatter)
      @game.guess_card_in_position(coordinates)
      self.display_board
      sleep(1)

      if @game.first_guess?
        @game.save_guess
      else
        @game.process_guess
      end
    end
  end

  def display_board
    board = @game.board
    system("clear")
    @board_display.display_board(board)
  end

end
