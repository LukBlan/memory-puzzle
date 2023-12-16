class Card
  attr_reader :symbol, :found

  def initialize(symbol)
    @symbol = symbol
    @found = true
  end

  def toggle_found
    @found = !found
  end
end
