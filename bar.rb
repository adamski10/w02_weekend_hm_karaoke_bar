class Bar
  def sale(room, guest)
    room.check_if_room_available()
    guest.buy_ticket(room)
    room.sell_ticket(room.price)
    room.guest_check_in(guest)
    return "Thank you"
  end

end