class Room

  attr_reader :number

  def initialize(number)
    @number = number
    @songs = []
  end

  def song_count()
    @songs.length()
  end

  def add_song(song_name)
    @songs << song_name
  end

end
