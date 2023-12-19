class HumanPlayer
  def initialize(input_separator)
    @input_separator = input_separator
  end

  def get_input(max_size, console_formatter, valid_moves)
    user_input = get_user_input(max_size, console_formatter, valid_moves)
    coordinates = user_input.split(@input_separator)
    coordinates.map(&:to_i)
  end

  def valid_input?(user_input, max_size, valid_moves)
    user_input.count(@input_separator) == 1 && valid_input_values?(user_input, max_size, valid_moves)
  end

  def valid_input_values?(user_input, max_size, valid_moves)
    split_input = user_input.split(@input_separator)
    first_value = split_input[0].to_i
    second_value = split_input[1].to_i
    self.between_range(first_value, 0, max_size) &&
      self.between_range(second_value, 0, max_size) && valid_moves.include?([first_value, second_value])
  end

  def between_range(value, min_value, max_value)
    value >= min_value && value <= max_value
  end

  def get_user_input(max_size, console_formatter, valid_moves)
    loop do
      print("Enter a position (e.g 0#{@input_separator}0): ")
      user_input = gets.chomp

      if self.valid_input?(user_input, max_size, valid_moves)
        return user_input
      end

      console_formatter.display_indented_message("Invalid input, try again")
    end
  end
end
