require_relative 'test_helper'
require './lib/item'
require './lib/vendor'

class VendorTest < Minitest::Test

  def setup
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new("Rocky Mountain Fresh")

  end

  def test_it_exists
    assert_instance_of Vendor, @vendor
  end

  def test_attributes
    assert_equal "Rocky Mountain Fresh", @vendor.name
    assert_equal ({}), @vendor.inventory
  end
end


# pry(main)> item2.name
# #=> "Tomato"
#
# pry(main)> item2.price
# #=> 0.50
#
# pry(main)> vendor.name
# #=> "Rocky Mountain Fresh"
#
# pry(main)> vendor.inventory
# #=> {}
#
# pry(main)> vendor.check_stock(item1)
# #=> 0
#
# pry(main)> vendor.stock(item1, 30)
#
# pry(main)> vendor.inventory
# #=> {#<Item:0x007f9c56740d48...> => 30}
#
# pry(main)> vendor.check_stock(item1)
# #=> 30
#
# pry(main)> vendor.stock(item1, 25)
#
# pry(main)> vendor.check_stock(item1)
# #=> 55
#
# pry(main)> vendor.stock(item2, 12)
#
# pry(main)> vendor.inventory
# #=> {#<Item:0x007f9c56740d48...> => 55, #<Item:0x007f9c565c0ce8...> => 12}
