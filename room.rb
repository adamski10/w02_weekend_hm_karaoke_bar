class Room

  attr_reader :music_genre, :capacity, :price

  def initialize(music_genre, capacity, price)
    @music_genre = music_genre
    @capacity = capacity
    @price = price
  end
end