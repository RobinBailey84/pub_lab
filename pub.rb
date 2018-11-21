class Pub

  attr_reader :pub_name, :till

  def initialize(pub_name, till, drinks)
    @pub_name = pub_name
    @till = till
    @drinks = drinks
  end

  def drinks_count()
    return @drinks.count
  end

  def find_drink_by_name(drink_to_find)
    for drink in @drinks
      if drink.drink_name == drink_to_find
        return drink
      end
    end
    return nil
  end

  def has_enough_cash(customer, chosen_drink_name)
    chosen_drink = find_drink_by_name(chosen_drink_name)
    if customer.wallet >= chosen_drink.price
      return true
    end
  end



  def sell_drink(customer, drink_name)
    drink_to_remove = find_drink_by_name(drink_name)
    if drink_to_remove != nil
      if customer_age(customer) == true
        if customer_drunkenness(customer) == true
          has_enough_cash(customer, drink_to_remove.drink_name)
          @till += drink_to_remove.price
          @drinks.delete(drink_to_remove)
        end
      end
    end
  end

  def customer_age(customer)
    if customer.age >= 18
      return true
    end
  end

  def customer_drunkenness(customer)
    if customer.drunkenness < 40
      return true
    else
      return "You're too drunk!"
    end
  end








end
