class Card
  attr_reader :symbol, :found

  def initialize(symbol)
    @symbol = symbol
    @found = false
  end

  def toggle
    @found = !@found
  end

  def eql?(other)
    @symbol == other.symbol
  end
end
