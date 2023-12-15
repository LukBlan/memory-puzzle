require_relative './ui/console_interface'
require_relative './domain/board/board_factory'

cards = ("A".."Z").to_a
board_factory = BoardFactory.new(4, cards)
board = board_factory.create
p board.board
console_interface = ConsoleInterface.new(board)