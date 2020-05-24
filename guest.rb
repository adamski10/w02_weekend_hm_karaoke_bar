class Guest

  attr_reader :name, :wallet, :fav_song

  def initialize(name, wallet,fav_song)
    @name = name
    @wallet = wallet
    @fav_song = fav_song
  end


  def buy_ticket(room)
    @wallet -= room.price if @wallet >= room.price && room.check_if_room_available() != "Room full"
    "Maybe another time" if @wallet < room.price || room.check_if_room_available() == "Room full"
  end

  # def fav_song_found(room)
  #   for song in @songs_list
  #     if song.title == guest.fav_song   # not looking at the right thing
  #       return "Wooo"
  #     end
  #   end
  # end
end