require "pry"

class Dish
  attr_accessor :item, :price

  def initialize(item, price)
    @item = item
    @price = price
  end
end

dish1 = Dish.new("Sandwhich", "4.00")
dish2 = Dish.new("Salad", "3.00")
dish3 = Dish.new("Soup", "3.00")
dish4 = Dish.new("Fries", "2.00")
dish5 = Dish.new("Rice", "2.00")
dish6 = Dish.new("Veggies", "1.00")

@main_dishes = [ dish1, dish2, dish3 ]
@side_dishes = [ dish4, dish5, dish6 ]
@cart = []


def choose_main_dish
  puts "Choose a main dish:"
  @main_dishes.each_with_index do |dish, i|
    puts "#{i + 1}) #{dish.item}($#{dish.price})"
  end
  print "> "

  case gets.to_i
    when 1
      add_to_cart(@main_dishes[0])
    when 2
      add_to_cart(@main_dishes[1])
    when 3
      add_to_cart(@main_dishes[2])
    else
      puts "Option not available"
      choose_main_dish
  end
end

def add_to_cart(dish)
  @cart << dish
end

def choose_side_dish
  puts "Choose a side dish:"
  @side_dishes.each_with_index do |dish, i|
    puts "#{i + 1}) #{dish.item}($#{dish.price})"
  end
  print "> "

  case gets.to_i
  when 1
    add_to_cart(@side_dishes[0])
  when 2
    add_to_cart(@side_dishes[1])
  when 3
    add_to_cart(@side_dishes[2])
  else
    puts "Option not available"
    choose_side_dish
  end
end

def display_cart_items
  puts "Your order consists of:"
  @cart.each do |dish|
    puts "#{dish.item}"
  end
end

def display_total
  p1 = @cart[0].price.to_i
  p2 = @cart[1].price.to_i
  p3 = @cart[2].price.to_i
  @total = p1 + p2 + p3
  print "Your total is: $"
  puts @total
end


choose_main_dish
choose_side_dish
choose_side_dish
display_cart_items
display_total