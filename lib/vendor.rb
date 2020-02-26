class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def potential_revenue
    @inventory.sum { |item| (item[0].price.gsub(/[^\d\.]/, '').to_f * item[1]) }

  end

  end
