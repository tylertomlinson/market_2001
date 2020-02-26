require_relative 'test_helper'
require './lib/item'
require './lib/vendor'
require './lib/market'

class MarketTest < Minitest::Test

  def setup
    @market = Market.new("South Pearl Street Farmers Market")
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  end

  def test_it_exists
    assert_instance_of Market, @market
  end

  def test_attributes
    assert_equal "South Pearl Street Farmers Market", @market.name
    assert_equal [], @market.vendors
  end

  def test_market_can_add_vendors_with_stock
    assert_equal [], @market.vendors

    @market.add_vendor(@vendor1)
    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)

    assert_equal [@vendor1], @market.vendors

    @market.add_vendor(@vendor2)
    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)

    assert_equal [@vendor1, @vendor2], @market.vendors

    @market.add_vendor(@vendor3)
    @vendor3.stock(@item1, 65)

    assert_equal [@vendor1, @vendor2, @vendor3], @market.vendors
  end

  def test_market_can_list_vendors_by_name
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)

    expected = ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"]

    assert_equal expected, @market.vendor_names
  end
end

# pry(main)> market.vendors_that_sell(item1)
# #=> [#<Vendor:0x00007fe1348a1160...>, #<Vendor:0x00007fe134910650...>]
#
# pry(main)> market.vendors_that_sell(item4)
# #=> [#<Vendor:0x00007fe1349bed40...>]
#
# pry(main)> vendor1.potential_revenue
# #=> 29.75
#
# pry(main)> vendor2.potential_revenue
# #=> 345.00
#
# pry(main)> vendor3.potential_revenue
# #=> 48.75
