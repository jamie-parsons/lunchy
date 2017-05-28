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
  attr_accessor :choices, :wallet

  def initialize(choices, wallet)
    @choices = []
    puts "How much money do you have?"
    print "> "
    @wallet = gets.strip.to_f
    menu
  end
end

class Lunchy
  attr_accessor :buyer

    def initialize
      @buyer = Buyer.new
    end
end

class Menu
  attr_accessor :buyer

  def main_dish
    puts "Choose your main dish:"
    puts "1) Burger, 7.50"
    puts "2) Chicken Salad, 7.00"
    puts "3) Veggie Bowl, 6.50"
    puts "Enter 1, 2, or 3 for your choice, or 4 to quit."
    print "> "
    main_dish_choice = gets.strip.to_i
    case main_dish_choice
    when 1
      buyer.choices << main_dish.new("Burger", 7.50)
    when 2
      buyer.choices << main_dish.new("Chicken Salad", 7.00)
    when 3
      buyer.choices << main_dish.new("Veggie Bowl", 6.50)
    when 4
      exit
    when 0
      print_array
    else
      puts "Not a valid choice, please try again!"
      main_dish
    end
  end

  def print_array
    @choices.each do |items|
      puts items
    end
  end
end

Lunchy.new
