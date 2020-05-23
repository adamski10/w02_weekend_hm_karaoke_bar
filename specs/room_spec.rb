require('minitest/autorun')
require('minitest/reporters')
require_relative('../guest.rb')
require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../bar.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class RoomTest < Minitest::Test
  
  def setup
    @bar = Bar.new()
    @guest_1 = Guest.new("Mike", 100)
    @guest_2 = Guest.new("George", 10)
    @rock_room = Room.new("Rock", 3, 20)
    @jazz_room = Room.new("Jazz", 1, 10)
    @ballads_room = Room.new("Metal", 2, 30)
    @song_1 = Song.new("Child in time", "Deep Purple", :rock)
    @song_2 = Song.new("Sultans of swing", "Dire Straits", :rock)
    @song_3 = Song.new("Brothers in arms", "Dire Straits", :rock)
    @song_4 = Song.new("The Unforgiven", "Nothing else matters", :rock_ballad)
    @song_5 = Song.new("Love hurts", "Nazareth", :rock_ballad)
    # rock_playlist =  [@song_1, @song_2]
    @mixed_playlist = [@song_1, @song_2, @song_3, @song_4, @song_5]
  end

  def test_get_room_genre
    assert_equal("Rock", @rock_room.music_genre())
  end

  def test_can_add_to_playlist_by_genre
    expected_result = [@song_1, @song_2, @song_3]
    assert_equal(expected_result, @rock_room.add_to_playlist_by_genre(@mixed_playlist, :rock))
  end 

  def test_can_add_to_playlist_by_artist
    expected_result = [@song_2, @song_3]
    assert_equal(expected_result, @rock_room.add_to_playlist_by_artist(@mixed_playlist, "Dire Straits"))
  end 

  def test_can_check_in_guest
    expected_result = [@guest_1]
    assert_equal(expected_result, @rock_room.guest_check_in(@guest_1))
  end

  def test_cannot_check_in_guest
    @jazz_room.guest_check_in(@guest_1)
    assert_equal("Room full", @jazz_room.guest_check_in(@guest_2))
  end

  def test_can_check_out_guest
    @rock_room.guest_check_in(@guest_1)
    @rock_room.guest_check_in(@guest_2)
    expected_result = [@guest_1]
    assert_equal(expected_result, @rock_room.guest_check_out("George"))
  end

  def test_check_room_capacity
    assert_equal(3, @rock_room.capacity())
  end

  def test_check_room_capacity_exceeded
    @jazz_room.guest_check_in(@guest_1)
    expected_result = "Room full"
    assert_equal("Room full", @jazz_room.check_if_room_available())
  end

  def test_can_sell_ticket
    @rock_room.sell_ticket(@rock_room.price)
    assert_equal(120, @rock_room.till)
  end

  def test_sale_room_avilable_guest_can_afford
    @bar.sale(@rock_room, @guest_1)
    assert_equal(80, @guest_1.wallet())
    assert_equal(120, @rock_room.till())
    assert_equal(1, @rock_room.guests_list().count)
  end

  def test_sale_room_avilable_guest_cannot_afford
    @bar.sale(@rock_room, @guest_2)
    assert_equal("Maybe another time", @guest_2.buy_ticket(@rock_room))
  end

  def test_sale_room_not_avilable_guest_can_afford
    @jazz_room.guest_check_in(@guest_2)
    @bar.sale(@jazz_room, @guest_1)
    assert_equal("Room full", @jazz_room.check_if_room_available())
    # assert_equal(120, @rock_room.till())
    # assert_equal(1, @rock_room.guests_list().count)
  end
end