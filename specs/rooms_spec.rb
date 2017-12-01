require("minitest/autorun")
require("minitest/rg")
require_relative("../rooms")
require_relative("../songs")
require_relative("../guests")

class TestRoom < MiniTest::Test

  def setup
    @room = Room.new(2)

    @song_1 = Song.new("Grease Lightening")
    @guest_1 = Guest.new("Alison")
    @guest_2 = Guest.new("Hilary")
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

  def test_room_has_empty_guest_array
    assert_equal(0, @room.guest_count())
  end

  def test_check_in_guest
    @room.check_in(@guest_1)
    assert_equal(1, @room.guest_count())
  end


end
