require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../customer.rb')
require_relative('../drink.rb')

class PubTest < MiniTest::Test

  def setup()
    drink1 = Drink.new("Beer", 5)
    drink2 = Drink.new("Wine", 4)
    drink3 = Drink.new("Coke", 2)

    drinks = [drink1, drink2, drink3]

    @pub = Pub.new("The Howlin Wolf", 500, drinks)
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

  def test_remove_drink()
    @pub.remove_drink("Beer")
    assert_equal(2,@pub.drinks_count)
  end












end
