require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../food.rb')

class FoodTest < MiniTest::Test

  def setup()
    @food = Food.new("Crisps", 1, 1)
  end

def test_food_has_name()
  assert_equal("Crisps", @food.food_name)
end



end
