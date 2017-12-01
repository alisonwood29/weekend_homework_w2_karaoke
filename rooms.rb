class Room

  attr_reader :number

  def initialize(number)
    @number = number
    @songs = []
    @guests = []
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

end
