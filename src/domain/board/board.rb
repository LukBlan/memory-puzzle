class Board
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def valid_moves
    valid_moves = []

    @grid.each.with_index do |row, row_index|
      row.each_with_index do |card, column_index|
        valid_moves << [row_index, column_index] unless card.face_up
      end
    end

    valid_moves
  end

  def game_over?
    @grid.all? do |row|
      row.all? do |card|
        card.face_up
      end
    end
  end

  def compare_cards_in_coordinates(coordinates, last_coordinates)
    actual_card = get_card(coordinates)
    last_card = get_card(last_coordinates)
    actual_card.eql?(last_card)
  end

  def get_size
    @grid.length
  end

  def get_card(coordinates)
    row = coordinates[0]
    column = coordinates[1]
    @grid[row][column]
  end

end
