require('minitest/autorun')
require('minitest/reporters')
require_relative('../guest.rb')
require_relative('../room.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class GuestTest < Minitest::Test

  def setup
    @guest_1 = Guest.new("Mike", 100)
    @guest_2 = Guest.new("George", 20)
    @rock_room = Room.new("Rock", 3, 20)
    @jazz_room = Room.new("Jazz", 2, 30)
  end

  def test_say_name
    assert_equal("Mike", @guest_1.name())
  end

  def test_can_afford_ticket
    @guest_1.buy_ticket(@rock_room)
    assert_equal(80, @guest_1.wallet)
  end

  def test_cannot_afford_ticket
    assert_equal("Maybe another time", @guest_2.buy_ticket(@jazz_room))
  end
end
