class ConsoleInterface
  def initialize(board, board_display)
    @board = board
    @board_display = board_display
  end

  def init
    @board_display.display_board(@board)
  end

end
