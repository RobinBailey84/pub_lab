require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../food.rb')

class PubTest < MiniTest::Test

  def setup()
    drink1 = Drink.new("Beer", 5, 4)
    drink2 = Drink.new("Wine", 4, 6)
    drink3 = Drink.new("Coke", 2, 0)

    drinks = [drink1, drink2, drink3]

    @pub = Pub.new("The Howlin Wolf", 500, drinks)

    @customer = Customer.new("Robin", 150, 19, 5)

  end

  def test_pub_has_drink()
    count = @pub.drinks_count
    assert_equal(3, count)
  end

  def test_pub_has_name
    assert_equal("The Howlin Wolf", @pub.pub_name)
  end

  def test_pub_has_till()
    assert_equal(500, @pub.till)
  end

  # def test_remove_drink()
  #   @pub.remove_drink("Beer")
  #   assert_equal(2,@pub.drinks_count)
  # end

  def test_can_find_drink_by_name()
    result = @pub.find_drink_by_name("Beer")
    assert_equal(5, result.price)
  end

  def test_cant_find_drink_by_name()
    result = @pub.find_drink_by_name("sambuca")
    assert_nil(result)
  end

  def test_sell_drink()
    @pub.sell_drink(@customer, "Wine")
    assert_equal(2, @pub.drinks_count)
  end

  def test_customer_can_buy_drink()
    result = @pub.has_enough_cash(@customer, "Wine")
    assert_equal(true, result)
  end

def test_customer_is_old_enough()
  result = @pub.customer_age(@customer)
  assert_equal(true, result)
end


def test_is_customer_too_drunk()
  @customer2 = Customer.new("John", 20, 30, 55)
  result = @pub.customer_drunkenness(@customer2)
  assert_equal("You're too drunk!", result)
end








end
