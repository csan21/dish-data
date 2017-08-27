require_relative 'dish'
require_relative 'dish_data'

if ARGV.any?
  dish_data = DishData.new

  if    ARGV[0] == "first"
    dish_data.load_dishes("data_one.csv")
    dish_data.check_for_target
  elsif ARGV[0] == "second"
    dish_data.load_dishes("data_two.csv")
    dish_data.check_for_target
  elsif ARGV[0] == "third"
    dish_data.load_dishes("data_three.csv")
    dish_data.check_for_target
  else
    puts "Please enter first, second, or third as an argument"
  end
end
