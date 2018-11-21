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

def remove_drink(drink_name)
  for drink in @drinks
    if drink.drink_name == drink_name
      drink_to_remove = drink
      @till += drink.price
    end
  end
  drink_to_sell = @drinks.delete(drink_to_remove)
  return drink_to_sell
end






end
