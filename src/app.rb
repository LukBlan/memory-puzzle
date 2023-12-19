require_relative './ui/console_interface'
require_relative './domain/board/board_factory'
require_relative './ui/board_display'
require_relative './domain/game'
require_relative './domain/players/human_player'
require_relative './ui/console_formatter'

# Domain
cards = ("A".."Z").to_a
board_factory = BoardFactory.new(4, cards)
board = board_factory.create
human_player = HumanPlayer.new(",")
game = Game.new(board, human_player)

# Ui
board_display = BoardDisplay.new
console_formatter = ConsoleFormatter.new(50)
console_interface = ConsoleInterface.new(game, board_display, console_formatter)
console_interface.init