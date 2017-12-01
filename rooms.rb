class Room

  attr_reader :number, :capacity

  def initialize(number, capacity)
    @number = number
    @songs = []
    @guests = []
    @capacity = capacity
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

end
