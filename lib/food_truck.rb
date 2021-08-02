require './item'

class FoodTruck
  attr_reader :name,
              :inventory

  def initialize(name)
    @name      = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory.keys.include?(item)
      @inventory[item]
    else
      0
    end
  end

  def stock(item, quantity)
    @inventory[item] = quantity
  end

  def potential_revenue
    @inventory.sum do |item, quantity|
      item.price * quantity
    end
  end
end
