require_relative './board'
require_relative './../card'

class BoardFactory
  def initialize(size, cards)
    @size = size
    @cards = cards
  end

  def create
    total_cards = (@size * @size) / 2
    board = self.generate_board
    self.populate_board(board, total_cards)
    Board.new(board)
  end

  def generate_board
    Array.new(@size) {[]}
  end

  def populate_board(board, total_cards)
    total_cards.times do |card_index|
      2.times do
        self.locate_card(board, card_index)
      end
    end
  end

  def locate_card(board, card_index)
    card = @cards[card_index]
    random_position = rand(0...@size)

    if board[random_position].length == @size
      locate_card(board, card_index)
    else
      board[random_position] << Card.new(card)
    end
  end
end
