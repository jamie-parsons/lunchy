# require "Pry"
# Basic Objectives:
# - the user chooses from a list of main dishes
# - the user chooses 2 side dish items
# - computer repeats users order
# - computer totals lunch items and displays total
#
# Bonus Objectives:
# - the user can choose as many "add-on" items as they want before getting total
# - the user can clear their choices and start over
# - the user has a wallet total they start with and their choices cannot exceed what they can pay for
# - the program is in a loop to keep asking the user to make new orders until they type 'quit' at any time
# - main dishes and side items have descriptions with them and the user has an option to view the description /nutritional facts before they order (hint: think hashes)
# - descriptions of food can have multiple options like nutritional facts, calories, fat content ect...(hint: think nested hashes)
# - display to the user not only their total but the total fat content/calories / carbs / etc...

#Buyer class, wallet class, Dishes class, main dish class, side dish class, extras
class Buyer
  attr_accessor :wallet, :choices

  def initialize
    @choices = []
    puts "How much money do you have?"
    print "> $"
    @wallet = gets.strip.to_f
  end
end

class Dish
  attr_accessor :dish, :price

  def initialize(dish, price)
    @dish = dish
    @price = price
  end
end

class Lunchy
  attr_accessor :buyer

  def initialize
    @buyer = Buyer.new
    main_dish
  end

  def main_dish
    puts "Choose your main dish:

**********************************"
    puts "1) Burger, $7.50"
    puts "2) Chicken Salad, $7.00"
    puts "3) Veggie Bowl, $6.50
**********************************"

    puts "\nEnter (1), (2), or (3) for your choice,
    (4) to list your order,
    (5) to clear your entire order,
    (6) to remove your last addition,
    (7) to quit."
    print "> "
    case gets.strip.to_i
    when 1
      buyer.choices << Dish.new("Burger", 7.50)
    when 2
      buyer.choices << Dish.new("Chicken Salad", 7.00)
    when 3
      buyer.choices << Dish.new("Veggie Bowl", 6.50)
    when 4
      print_array
    when 5
      buyer.choices.clear
      main_dish
    when 6
      buyer.choices.pop
      main_dish
    when 7
      exit
    else
      puts "Not a valid choice, please try again!"
      main_dish
    end
    check_total
  end

  def side_dish
    puts "Choose your side dish:

**********************************"
    puts "1) Red Soup, $1.50"
    puts "2) Purple Soup, $5.25"
    puts "3) Greenish Sludge, slightly fuzzy, $0.25
**********************************"

    puts "\nEnter (1), (2), or (3) for your choice,
    (4) to list your order,
    (5) to clear your entire order,
    (6) to remove your last addition,
    (7) to quit."
    print "> "
    case gets.strip.to_i
    when 1
      buyer.choices << Dish.new("Red Soup", 1.50)
    when 2
      buyer.choices << Dish.new("Purple Soup", 5.25)
    when 3
      buyer.choices << Dish.new("Greenish Sludge, slightly fuzzy", 0.25)
    when 4
      print_array
    when 5
      buyer.choices.clear
      main_dish
    when 6
      buyer.choices.pop
      side_dish
    when 7
      exit
    else
      puts "Not a valid choice, please try again!"
      side_dish
    end
    check_total
  end

  def check_total
    if (buyer.choices.map(&:price).reduce(:+).to_f) > (buyer.wallet)
      puts "Sorry, you don't have enough money. (1) to clear order or (2) to clear last entry."
      print "> "
      case gets.strip.to_i
      when 1
        buyer.choices.clear
      when 2
        buyer.choices.pop
      else
        puts "Sorry try again!"
        check_total
      end
    else
      puts "Please enter (1) to add a main dish, (2) to add a side dish, or (3) to finish."
      print "> "
      case gets.strip.to_i
      when 1
        main_dish
      when 2
        side_dish
      when 3
        finish_order
      else
        puts "Please try again!"
        check_total
      end
    end
  end

  def finish_order
    buyer.choices.each do |choices|
    puts "You've ordered: #{buyer.choices.map(&:dish)}"
    puts "Your total is $#{sprintf("%0.02f", buyer.choices.map(&:price).reduce(:+).to_f)}"
    buyer.wallet = buyer.wallet - buyer.choices.map(&:price).reduce(:+).to_f
    puts "Your change is $#{sprintf("%0.02f", buyer.wallet)}"
    puts "Thank you for your order!"
    puts "Enter (1) to place another order or (2) to leave."
    print "> "
    case gets.strip.to_i
      when 1
        buyer.choices.clear
        main_dish
      when 2
        exit
      else
        puts "Please try again!"
        finish
      end
    end
  end

  def print_array
     buyer.choices.each do |choices|
     puts "#{choices.dish} $#{sprintf("%0.02f", choices.price)}"
     end
    puts "Total: $#{sprintf("%0.02f", buyer.choices.map(&:price).reduce(:+).to_f)}"
  end
end


Lunchy.new
