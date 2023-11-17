require "test_helper"

class CartTest < ActiveSupport::TestCase
  test "adding some unique product to cart" do
    cart = Cart.create
    line_item = cart.add_product(products(:ruby))

    assert_equal 1, line_item.quantity
  end

  test 'adding duplicate products to cart' do
    cart = Cart.create
    cart.add_product(products(:ruby)).save!
    cart.add_product(products(:ruby)).save!

    assert_equal 2, cart.line_items[0].quantity
  end
end
