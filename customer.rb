class Customer

  attr_reader :customer_name, :wallet, :age, :drunkenness

  def initialize(customer_name, wallet, age, drunkenness)
    @customer_name = customer_name
    @wallet = wallet
    @age = age
    @drunkenness = drunkenness

  end

  def buys_drink(pub, drink_name)

    # if @customer.has_enough_cash == true
    drink_to_buy = pub.sell_drink(self, drink_name)
    # if @wallet >= drink_to_buy.price
    @wallet -= drink_to_buy.price
    @drunkenness += drink_to_buy.alcohol_level
  end

  def buys_food(food)
      @wallet -= food.price
      @drunkenness -= food.rejuvenation_level


  end

end

# def has_enough_cash(pub, chosen_drink_name)
#   chosen_drink = pub.find_drink_by_name(chosen_drink_name)
#   if @wallet >= chosen_drink.price
#     return true
#   end
