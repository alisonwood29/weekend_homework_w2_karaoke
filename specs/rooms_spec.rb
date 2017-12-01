require("minitest/autorun")
require("minitest/rg")
require_relative("../rooms")
require_relative("../songs")
require_relative("../guests")

class TestRoom < MiniTest::Test

  def setup
    @room = Room.new(2, 5)

    @song_1 = Song.new("Grease Lightening")
    @guest_1 = Guest.new("Alison")
    @guest_2 = Guest.new("Hilary")
    @guest_3 = Guest.new("Findlay")
    @guest_4 = Guest.new("Jayne")
    @guest_5 = Guest.new("Nicole")
    @guest_6 = Guest.new("Jo")
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

  def test_check_out_guest
    @room.check_in(@guest_1)
    @room.check_in(@guest_2)
    @room.check_in(@guest_3)
    @room.check_out(@guest_2)
    assert_equal(2, @room.guest_count())
  end

  def test_room_capacity
    assert_equal(5, @room.capacity())
  end

  def test_room_too_full
    @room.check_in(@guest_1)
    @room.check_in(@guest_2)
    @room.check_in(@guest_3)
    @room.check_in(@guest_4)
    @room.check_in(@guest_5)
    @room.check_in(@guest_6)
    assert_equal("Sorry, room is full", @room.over_capacity)
  end


end
