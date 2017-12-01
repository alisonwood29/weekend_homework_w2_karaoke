require("minitest/autorun")
require("minitest/rg")
require_relative("../songs")

class TestSong < MiniTest::Test

  def setup
    @song_1 = Song.new("Grease Lightening")
  end

  def test_song_name
    assert_equal("Grease Lightening", @song_1.name())
  end

  def test_song_can_play
    assert_equal("Now playing Grease Lightening", @song_1.play())
  end

end
