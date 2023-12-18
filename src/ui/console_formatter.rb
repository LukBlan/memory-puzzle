class ConsoleFormatter
  def initialize(line_length)
    @line_length = line_length
  end

  def display_indented_message(message)
    puts("    - #{message}")
  end

  def show_message_between_dashes(message)
    line = get_line
    message_in_middle = get_text_in_middle(message)

    puts(line)
    puts(message_in_middle)
    puts(line)
  end

  def get_text_in_middle(text)
    text_in_middle = ""
    middle_point = @line_length / 2
    spaces_amount = middle_point - (text.length / 2)

    spaces_amount.times { text_in_middle += " " }
    text_in_middle + text
  end

  def get_line
    line = ""
    @line_length.times { line += "-"}
    line
  end
end
