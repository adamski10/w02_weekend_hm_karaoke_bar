class Room

  attr_reader :music_genre, :capacity, :price

  def initialize(music_genre, capacity, price)
    @music_genre = music_genre
    @capacity = capacity
    @price = price
    @songs_list = []
    @guests_list = []
  end

  def add_to_playlist_by_genre(list, genre)
    play_list = list.find_all {|song| song.genre == genre}
    return play_list
  end
    
  def add_to_playlist_by_artist(list, artist)
    play_list = list.find_all {|song| song.artist == artist}
    return play_list 
  end
  
  def guest_check_in(guest)
    @guests_list << guest 
  end

  def guest_check_out(name)
    @guests_list.each {|guest| @guests_list.delete(guest) if guest.name == name}
  end
end