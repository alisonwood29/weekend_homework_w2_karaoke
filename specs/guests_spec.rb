require("minitest/autorun")
require("minitest/rg")
require_relative("../guests")

class TestGuest < MiniTest::Test

  def setup
    @guest = Guest.new("Alison")
  end

  def test_guest_has_name
    assert_equal("Alison", @guest.name)
  end

end
