class Board
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def game_over
    @grid.all? do |row|
      row.all? do |card|
        card.found
      end
    end
  end

  def toggle_card_in_position(coordinates)
    card = get_card(coordinates)
    card.toggle
  end

  def compare_cards_in_coordinates(coordinates, last_coordinates)
    actual_card = get_card(coordinates)
    last_card = get_card(last_coordinates)
    actual_card.eql?(last_card)
  end

  def get_card(coordinates)
    row = coordinates[0]
    column = coordinates[1]
    @grid[row][column]
  end

end
