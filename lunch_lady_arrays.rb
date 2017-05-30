# Lunch Lady Assignment Pseudocode:
#
#
# Basic Objectives:
# - user chooses from a list of main dishes
# - user chooses 2 side dish items
# - computer repeats users order
# - computer totals lunch items and displays total
#
# Bonus Objectives:
# - user can choose as many "add-on" items as they want before getting total
# - user can clear their choices and start over
# - user has a wallet total they start with and their choices cannot exceed what they can pay for
# - program is in a loop to keep asking the user to make new orders until they type 'quit' at any time
# - main dishes and side items have descriptions with them and the user has an option to view the description /nutritional facts before they order (hint: think hashes)
# - descriptions of food can have multiple options like nutritional facts, calories, fat content ect...(hint: think nested hashes)
# - display to the user not only their total but the total fat content / calories / carbs / ect...
#


@main_dish = [["Steak",15.99,1000], ["Chicken",13.75,600], ["Vegetarian",12.99,[800]]]
@side_dish = [["Potatoes",3.50,300], ["Beans",2.50,150], ["Apples",3.75,320]]

def main_menu
  puts "Welcome, choose a main menu item: \n#{@main_dish[0][0]} costs #{@main_dish[0][1]}
  and is #{@main_dish[0][2]} calories;\n#{@main_dish[1][0]} costs #{@main_dish[1][1]}
  and is #{@main_dish[1][2]} calories;\n#{@main_dish[2][0]} costs #{@main_dish[2][1]}
  and is #{@main_dish[2][2]} calories;\n"
choice = gets.strip
  case choice
when "#{@main_dish[0][0]}"
  @main_total = @main_dish[0][1]
when "#{@main_dish[1][0]}"
  @main_total = @main_dish[1][1]
when "#{@main_dish[2][0]}"
  @main_total = @main_dish[2][1]
when "quit"
  exit
else
    puts "Error, please try again"
    main_menu
end
puts @main_total
side_dish
end

def side_dish
  puts "Please choose a side menu item, or type 'c' to clear : \n#{@side_dish[0][0]} costs #{@side_dish[0][1]}
  and is #{@side_dish[0][2]} calories;\n#{@side_dish[1][0]} costs #{@side_dish[1][1]}
  and is #{@side_dish[1][2]} calories;\n#{@side_dish[2][0]} costs #{@side_dish[2][1]}
  and is #{@side_dish[2][2]} calories;\n"
choice = gets.strip
case choice
when "#{@side_dish[0][0]}"
  @side_total = @side_dish[0][1]
when "#{@side_dish[1][0]}"
  @side_total = @side_dish[1][1]
when "#{@side_dish[2][0]}"
  @side_total = @side_dish[2][1]
when "c"
  main_menu
when "quit"
exit
else
  puts "Error, please try again"
  side_dish
end
order_total
end

# def order_total
#   tab = @order.collect { |p| p[@side_dish[0][0]]}
#   tab = tab.inject(:+)
#  puts "\n\nYour total is $#{tab}\n\n"
# end
# new_total = side_total + @main_total
# puts new_total

side_dish
end
main_menu
