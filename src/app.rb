require_relative './ui/console_interface'
require_relative './domain/board/board_factory'
require_relative './ui/board_display'

cards = ("A".."Z").to_a
board_factory = BoardFactory.new(4, cards)
board = board_factory.create

board_display = BoardDisplay.new
console_interface = ConsoleInterface.new(board, board_display)
console_interface.init