require("minitest/autorun")
require("minitest/rg")
require_relative("../rooms")
require_relative("../songs")
require_relative("../guests")

class TestRoom < MiniTest::Test

  def setup
    @room = Room.new(2, 5, 10)

    @song_1 = Song.new("Grease Lightening")

    @guest_1 = Guest.new("Alison", 30)
    @guest_2 = Guest.new("Hilary", 20)
    @guest_3 = Guest.new("Findlay", 10)
    @guest_4 = Guest.new("Jayne", 50)
    @guest_5 = Guest.new("Nicole", 20)
    @guest_6 = Guest.new("Jo", 60)
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

  def test_room_has_entry_fee
    assert_equal(10, @room.entry_fee())
  end

  def test_guest_pay_entry_fee
    fee = @room.entry_fee()
    @room.charge_fee(@guest_1, fee)
    assert_equal(20, @guest_1.money)
  end


end
