class Card
  attr_reader :symbol, :face_up

  def initialize(symbol)
    @symbol = symbol
    @face_up = false
  end

  def toggle
    @face_up = !@face_up

  end

  def eql?(other)
    @symbol == other.symbol
  end
end
