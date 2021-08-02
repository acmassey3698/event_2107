class Item

  attr_reader :name


  def initialize(information)
    @name  = information[:name]
    @price = information[:price]
  end

  def price
    @price.delete_prefix("$").to_f
  end

end
