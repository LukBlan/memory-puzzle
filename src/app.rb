require_relative './ui/console_interface'
require_relative './domain/board/board_factory'
require_relative './ui/board_display'
require_relative './domain/game'
require_relative './domain/human_player'

cards = ("A".."Z").to_a
board_factory = BoardFactory.new(4, cards)
board = board_factory.create
human_player = HumanPlayer.new(",")
game = Game.new(board, human_player)


board_display = BoardDisplay.new
console_interface = ConsoleInterface.new(game, board_display)
console_interface.init