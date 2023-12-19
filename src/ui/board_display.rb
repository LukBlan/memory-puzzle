class BoardDisplay
  def display_board(board)
    board_grid = board.grid
    display_row_index(board_grid)

    board_grid.each_with_index do |row, row_index|
      print "#{row_index}"

      row.each_with_index do |card|
        if card.face_up
          print " #{card.symbol}"
        else
          print("  ")
        end
      end

      puts
    end
  end

  def display_row_index(board_grid)
    board_length = board_grid.length
    print(" ")

    (0...board_length).each do |index|
      print " #{index}"

    end
    puts
  end
end
