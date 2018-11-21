class Customer

  attr_reader :customer_name, :wallet

  def initialize(customer_name, wallet)
    @customer_name = customer_name
    @wallet = wallet

  end

  def buys_drink(pub, drink_name)
    #loop through pubs drinks

    drink_to_buy = pub.remove_drink(drink_name)
    #if drink exists take out drink
    @wallet -= drink_to_buy.price
    #gets drink take away from customer wallet

    #add drink price to pub till


  end


end
