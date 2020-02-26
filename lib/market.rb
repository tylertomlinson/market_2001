class Market
  attr_reader :name,
  :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map(&:name)
  end

  def vendors_that_sell(item)
    @vendors.find_all { |vendor| vendor.inventory.include?(item) }
  end

  def total_inventory
    #WIP
    @vendors.reduce(Hash.new(0)) do |hash, vendor|
      vendor.inventory.each do |item, amount|
        hash[item] += amount
        hash
      end
      hash
    end
  end

  def sorted_item_list
    @vendors.flat_map do |vendor|
      vendor.inventory.map { |item| item[0].name }
    end.sort.uniq
  end
end
