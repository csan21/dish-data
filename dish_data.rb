require 'csv'
require_relative 'dish'

class DishData
  attr_accessor :dishes

  def initialize
    @dishes = []
    @target_total = 15.05
  end

  def load_dishes(filename)
    CSV.foreach(filename, headers: true) do |row|
      @dishes << Dish.new(name: row[0], price: row[1].scan(/[.0-9]/).join.to_f) # regex to remove the $ from the csv price and change it to float
    end
  end

  def list_dishes
    @dishes.each do |dish|
      # %.2f to ensure 2 decimal places even for 0
      puts "#{dish.name} - $#{format('%.2f', dish.price)}"
    end
  end

  def check_for_target
    total = []
    for i in 0..(@dishes.size) do
      # iterates through collection and selects the combination of dishes that have a sum of the target total
      @dishes.combination(i).to_a.select { |dish| total << dish if dish.sum(&:price) == @target_total }
    end

    current_total = total.flatten.sum(&:price)
    # conditions for meeting the target total
    if current_total == @target_total
      total.each do |item|
        puts '-----------------------------'
        puts 'DISHES THAT CAN BE BOUGHT'
        puts '-----------------------------'
        item.each(&:print_info)
        puts '-----------------------------'
        puts "ADDS UP TO $#{current_total}! \n\n"
      end
    else
      puts '-----------------------------------------------'
      puts 'No combinations of dishes meet the target total'
    end
  end
end
