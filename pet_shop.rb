def pet_shop_name(shop)
  return shop[:name]
end

def total_cash(shop)
  return shop[:admin][:total_cash]
end

def add_or_remove_cash(shop , cash)
  shop[:admin][:total_cash] += cash
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, pets)
  return shop[:admin][:pets_sold] += pets
end

def stock_count(shop)
  return shop[:pets].count
end

def pets_by_breed(shop , breed)
  return shop[:pets].select {|pet| pet[:breed] == breed}
end

def find_pet_by_name(shop , name)
  shop[:pets].select {|pet| pet[:name] == name}[0]
end

def remove_pet_by_name(shop, name)
  shop[:pets].reject! {|pet| pet[:name] == name}
end

def add_pet_to_stock(shop, pet)
  shop[:pets] << pet
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, cash)
  return customer[:cash] -= cash
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, pet)
  return customer[:pets] << pet
end

# OPTIONAL

def customer_can_afford_pet(customer, pet)
   if customer[:cash] > pet[:price]
     return true
   end
   return false
end

#or

def customer_can_afford_pet(customer, pet)
  customer[:cash] >= pet[:price]
end

#Integration

def sell_pet_to_customer(shop, pet, customer)
  return nil unless pet
  return nil unless customer_can_afford_pet(customer, pet)
  add_pet_to_customer(customer, pet)
  increase_pets_sold(shop, 1)
  customer[:cash] -= pet[:price]
  shop[:admin][:total_cash] += pet[:price]
end
