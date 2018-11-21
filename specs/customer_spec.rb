require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../food.rb')

class CustomerTest < MiniTest::Test

  def setup()
    @customer = Customer.new("Robin", 150, 19, 5)

  end

  def test_customer_has_name()
    assert_equal("Robin", @customer.customer_name)
  end

  def test_customer_has_wallet()
    assert_equal(150, @customer.wallet)
  end

  def test_customer_age()
    assert_equal(19, @customer.age)
  end

  def test_customer_can_buy_drink()
    drink1 = Drink.new("Beer", 5, 5)
    drink2 = Drink.new("Wine", 4, 6)
    drink3 = Drink.new("Coke", 2, 0)
    drinks = [drink1, drink2, drink3]

    pub = Pub.new("The George", 500, drinks)
    @customer.buys_drink(pub, "Beer")
    assert_equal(145, @customer.wallet)
    assert_equal(505, pub.till)

  end

  # def test_can_afford_drink()
  #   drink1 = Drink.new("Beer", 5)
  #   drink2 = Drink.new("Wine", 4)
  #   drink3 = Drink.new("Coke", 2)
  #   drinks = [drink1, drink2, drink3]
  #
  #   pub = Pub.new("The George", 500, drinks)
  #
  #   result = @customer.has_enough_cash(pub, "Wine")
  #   assert_equal(true, result)
  # end

  def test_customers_drunkenness_goes_up()
    drink1 = Drink.new("Beer", 5, 5)
    drink2 = Drink.new("Wine", 4, 6)
    drink3 = Drink.new("Coke", 2, 0)
    drinks = [drink1, drink2, drink3]

    pub = Pub.new("The George", 500, drinks)
    @customer.buys_drink(pub, "Beer")
    assert_equal(10, @customer.drunkenness)

  end

  def test_customer_is_rejuvenated()
    food = Food.new("Crisps", 1, 1)
    @customer.buys_food(food)
    assert_equal(4, @customer.drunkenness)
  end

end
