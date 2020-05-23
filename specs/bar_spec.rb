require('minitest/autorun')
require('minitest/reporters')
require_relative('../guest.rb')
require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../bar.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class BarTest < Minitest::Test
  
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