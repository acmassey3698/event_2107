class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    names = []
    @food_trucks.each do |truck|
      names << truck.name
    end
    names
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |truck|
      truck.inventory.include?(item)
    end
  end

  def all_items
    @food_trucks.flat_map do |truck|
      truck.inventory.keys
    end.uniq
  end

  def sorted_item_list
    ordered_items =
    all_items.sort_by do |item|
      item.name
    end

    ordered_items.map do |item|
      item.name
    end
  end

  def total_quantity(item)
    @food_trucks.sum do |truck|
      truck.check_stock(item)
    end
  end

  def total_inventory
    event_inventory = Hash.new(0)
    all_items.each do |item|
      event_inventory[item] = {quantity: total_quantity(item), food_trucks: food_trucks_that_sell(item)}
    end
    event_inventory
  end

  def overstocked_items

  end
end
