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

  def check_for_target
    total = []
    for i in 0..(@dishes.size) do
      # iterates through and selects the combination of dishes that have a sum of the target total
      @dishes.combination(i).to_a.select { |dish| total << dish if dish.sum(&:price) == @target_total }
    end

    # condition for a matched total
    if total.flatten.sum(&:price) == @target_total
      total.each do |item|
        item.each do |dish|
          p "#{dish.name} - #{dish.price}"
        end
        puts 'Can all be bought!'
      end
    else
      puts 'No combinations of dishes meet the target total'
    end
  end
end
