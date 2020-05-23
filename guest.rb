class Guest

  attr_reader :name, :wallet

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end


  def buy_ticket(room)
    @wallet -= room.price if @wallet >= room.price && room.check_if_room_available() != "Room full"
    "Maybe another time" if @wallet < room.price || room.check_if_room_available() == "Room full"
  end

end