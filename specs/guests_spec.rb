require("minitest/autorun")
require("minitest/rg")
require_relative("../guests")

class TestGuest < MiniTest::Test

  def setup
    @guest = Guest.new("Alison", 30)
  end

  def test_guest_has_name
    assert_equal("Alison", @guest.name)
  end

  def test_guest_has_money
    assert_equal(30, @guest.money)
  end

  def test_guest_can_pay_money
    amount = 5
    assert_equal(25, @guest.pay_money(amount))
  end

end
