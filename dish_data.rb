require 'csv'
require_relative 'dish'

class DishData
  attr_accessor :dishes

  def initialize
    @target_total = 15.05
    @dishes = []
  end

  def load_dishes(filename)
    CSV.foreach(filename, headers: true) do |row|
      @dishes << Dish.new(name: row[0],
                          price: row[1].scan(/[.0-9]/).join.to_f) # RegEx to remove the '$' and change to float
    end
  end

  def list_dishes
    @dishes.each do |dish|
      # %.2f to ensure 2 decimal places to show trailing zero
      puts "#{dish.name} - $#{format('%.2f', dish.price)}"
    end
  end

  def check_for_target
    total  = []
    length = 0..@dishes.size
    # iterates through and selects the combination of dishes that have a sum equal to target total
    for i in length do
      @dishes.combination(i).to_a
             .select { |dish| total << dish if dish.sum(&:price) == @target_total }
    end
    current_total = total.flatten.sum(&:price)
    # checks for meeting the target total
    if check_sum?(current_total)
      total.each do |dish|
        puts '-----------------------------'
        puts 'DISHES THAT CAN BE BOUGHT'
        puts '-----------------------------'
        dish.each(&:print_info)
        puts '-----------------------------'
        puts "ADDS UP TO $#{current_total}! \n\n"
      end
    else
      puts '-----------------------------------------------'
      puts "No combinations of dishes meet the target total \n\n"
    end
  end

  # returns boolean
  def check_sum?(total)
    total == @target_total
  end
end
