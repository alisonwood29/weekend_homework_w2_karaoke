require("pry")

class Room

  attr_reader :number, :capacity, :entry_fee, :till

  def initialize(number, capacity, entry_fee)
    @number = number
    @songs = []
    @guests = []
    @capacity = capacity
    @entry_fee = entry_fee
    @till = 0
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

  def check_out(guest)
    @guests.delete(guest)
  end

  def over_capacity
    return "Sorry, room is full" if @guests.length() > @capacity
  end

  def charge_fee(guest, amount)
    guest.pay_money(amount)
  end

  def check_in(guest)
    # binding.pry
    @guests << guest
    charge_fee(guest, @entry_fee)
    @till += @entry_fee
  end

  def play_song(guest)
    # binding.pry
    songs_playlist = @songs.map {|song| song.name}
    if songs_playlist.include?(guest.favourite_song())
      return "Whoo, my favourite!"
    else
      return "Song not found"
    end
  end


end
