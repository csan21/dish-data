require 'csv'
require_relative 'dish'

class DishData
  attr_accessor :dishes

  def initialize
    @dishes = []
  end

  def load_dishes(filename)
    CSV.foreach(filename, :headers => true, :header_converters => :symbol) do |row|
      @dishes << Dish.new(row)
    end
  end

  def check_for_target
    total = 0
    @dishes.each do |dish|
      total += dish.price.scan(/[.0-9]/).join().to_f
        p "#{dish.name}"
    end
    p sprintf('%.2f', total)
  end
end
