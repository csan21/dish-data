class Dish
  attr_reader :name, :price

  def initialize(args={})
    @name = args.fetch(:name)
    @price = args.fetch(:price)
  end

  def print_info
    "#{name}"
  end
end
