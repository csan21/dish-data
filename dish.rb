class Dish
  attr_reader :name, :price

  def initialize(args={})
    @name = args.fetch(:name)
    @price = args.fetch(:price)
  end
end
