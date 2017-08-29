require_relative 'dish'
require_relative 'dish_data'

if ARGV.any?
  dish_data = DishData.new

  if    ARGV[0] == 'first'
    dish_data.load_dishes('data_one.csv')
    puts '------------------'
    puts 'Meal list number 1'
    puts '------------------'
    dish_data.list_dishes
    dish_data.check_for_target

  elsif ARGV[0] == 'second'
    dish_data.load_dishes('data_two.csv')
    puts '------------------'
    puts 'Meal list number 2'
    puts '------------------'
    dish_data.list_dishes
    dish_data.check_for_target

  elsif ARGV[0] == 'third'
    dish_data.load_dishes('data_three.csv')
    puts '------------------'
    puts 'Meal list number 3'
    puts '------------------'
    dish_data.list_dishes
    dish_data.check_for_target

  else
    raise 'Please enter first, second, or third as an argument'
  end

else
  raise "Type in 'first', 'second', or 'third' after ruby runner.rb"
end
