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
end
