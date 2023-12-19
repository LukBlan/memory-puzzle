class ComputerPlayer
  def initialize
    @known_cards = Hash.new
    @match_guess = Hash.new
    @last_card = nil
  end

  def get_input(console_formatter, board, first_guess)
    new_move = nil

    if first_guess
      if matching_guess?
        new_move = @match_guess.keys[0]
      else
        new_move = get_random_move(board)
        self.check_if_new_match(new_move, board)
      end

      @last_card = board.get_card(new_move)
    else
      if matching_guess?
        key = @match_guess.keys[0]
        new_move = @match_guess[key]
        @match_guess.delete(key)
      else
        new_move = get_random_move(board)
        check_if_new_match(new_move, board)
      end

      @last_card = nil
    end

    new_move
  end

  def check_if_new_match(new_move, board)
    card = board.get_card(new_move)

    if @last_card.eql?(card)
      @known_cards.delete(card)
    elsif @known_cards.has_key?(card)
      @match_guess[new_move] = @known_cards[card]
      @known_cards.delete(card)
    else
      @known_cards[card] = new_move
    end

  end

  def matching_guess?
    @match_guess.keys.length > 0
  end

  def get_random_move(board)
    valid_moves = []
    p valid_moves
    face_down_moves = board.valid_moves
    performed_moves = @known_cards.values

    face_down_moves.each do |move|
      valid_moves << move if !performed_moves.include?(move)
    end

    valid_moves.sample
  end
end
