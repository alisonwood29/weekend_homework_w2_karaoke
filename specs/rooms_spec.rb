require("minitest/autorun")
require("minitest/rg")
require_relative("../rooms")
require_relative("../songs")
require_relative("../guests")

class TestRoom < MiniTest::Test

  def setup
    @room = Room.new(2, 5, 10)

    @song_1 = Song.new("Grease Lightening")
    @song_2 = Song.new("Super Freak")

    @guest_1 = Guest.new("Alison", 30, "Super Freak")
    @guest_2 = Guest.new("Hilary", 20, "Grease Lightening")
    @guest_3 = Guest.new("Findlay", 10, "Mambo No. 5")
    @guest_4 = Guest.new("Jayne", 50, "Love Yourself")
    @guest_5 = Guest.new("Nicole", 20, "Dancing Queen")
    @guest_6 = Guest.new("Jo", 60, "Let It Go")
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

  def test_til_is_empty
    assert_equal(0, @room.till())
  end

  def test_check_in_guest
    @room.check_in(@guest_1)
    assert_equal(1, @room.guest_count())
    assert_equal(20, @guest_1.money())
    assert_equal(10, @room.till())
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

  def test_room_has_entry_fee
    assert_equal(10, @room.entry_fee())
  end

  def test_guest_pay_entry_fee
    fee = @room.entry_fee()
    @room.charge_fee(@guest_1, fee)
    assert_equal(20, @guest_1.money)
  end

  def test_play_favourite_song__song_found
    @room.add_song(@song_1)
    @room.add_song(@song_2)
    assert_equal("Whoo, my favourite!", @room.play_song(@guest_2))
  end

  def test_play_favourite_song__song_not_found
    assert_equal("Song not found", @room.play_song(@guest_3))
  end


end
