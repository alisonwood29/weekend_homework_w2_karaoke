require("pry")

class Room

  attr_reader :number, :capacity, :entry_fee

  def initialize(number, capacity, entry_fee)
    @number = number
    @songs = []
    @guests = []
    @capacity = capacity
    @entry_fee = entry_fee
  end

  def song_count
    @songs.length()
  end

  def add_song(song_name)
    @songs << song_name
  end

  def guest_count
    @guests.length()
  end

  def check_in(guest)
    @guests << guest
  end

  def check_out(guest)
    @guests.delete(guest)
  end

  def over_capacity
    return "Sorry, room is full" if @guests.length() > @capacity
  end

  def charge_fee(guest, amount)
    guest.pay_money(amount)
  end

end
