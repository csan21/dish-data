require 'csv'
require_relative 'dish'

class DishData
  attr_accessor :dishes

  def initialize
    @dishes = []
    @target_total = 15.05
  end

  def load_dishes(filename)
    CSV.foreach(filename, :headers => true, :header_converters => :symbol) do |row|
      @dishes << Dish.new(row)
    end
  end

  def check_for_target
    total = 0
    @dishes.each do |dish|
      if total.to_f < @target_total
        total += dish.price.scan(/[.0-9]/).join().to_f
        if total.to_f == @target_total
          puts '#{dish.name}'
        else
          puts 'no combination'
        end
      end
    end
    # p sprintf('%.2f', total)
  end
end
