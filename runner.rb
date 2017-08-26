require_relative 'dish'
require_relative 'dish_data'

target_total = 15.05

if ARGV.any?
  dish_data = DishData.new

  if ARGV[0] == "first"
    dish_data.load_dishes("data_one.csv")
    dish_data.check_for_target
  end
end
