class Room

  attr_reader :music_genre, :capacity, :price, :till, :guests_list, :songs_list

  def initialize(music_genre, capacity, price)
    @music_genre = music_genre
    @capacity = capacity
    @price = price
    @songs_list = []
    @guests_list = []
    @till = 100
  end

  def add_to_playlist_by_genre(list, genre)
    play_list = list.find_all {|song| song.genre == genre}
    return play_list
  end
    
  def add_to_playlist_by_artist(list, artist)
    play_list = list.find_all {|song| song.artist == artist}
    return play_list 
  end
  
  def check_if_room_available()
    if @capacity > @guests_list.count
      return @guests_list.count
    else
    "Room full"
    end
  end
  
  def guest_check_in(guest)
    if check_if_room_available() != "Room full"
     @guests_list << guest
    else
      "Room full"
    end
  end

  def guest_check_out(name)
    @guests_list.each {|guest| @guests_list.delete(guest) if guest.name == name}
  end

  def sell_ticket(price)
      @till += price
  end

  # def sale(room, guest)
  #   room.check_room_capacity()
  #   room.sell_ticket(room.price)
  #   guest.buy_ticket(room)
  #   room.guest_check_in(guest)
  # end

  # def test_sale_and_check_in_capacity_ok_guest_can_afford
  #   @rock_room.guests_list().count
  #   @rock_room.sell_ticket(20)
  #   @guest_1.buy_ticket(@rock_room)
  #   @rock_room.guest_check_in(@guest_1)
  #   assert_equal(0, @rock_room.guests_list())
  #   assert_equal(120, @rock_room.till())
  #   assert_equal(80, @guest_1.wallet())
  #   assert_equal(1, @rock_room.guests_list().count)
end  