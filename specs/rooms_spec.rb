require("minitest/autorun")
require("minitest/rg")
require_relative("../rooms")
require_relative("../songs")

class TestRoom < MiniTest::Test

  def setup
    @room = Room.new(2)

    @song_1 = Song.new("Grease Lightening")
  end

  def test_room_has_number
    assert_equal(2, @room.number)
  end

  def test_room_has_empty_song_array
    assert_equal(0, @room.song_count)
  end

  def test_add_song_to_room
    @room.add_song(@song_1)
    assert_equal(1, @room.song_count())
  end

end
