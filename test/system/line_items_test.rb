require 'application_system_test_case'

class LineItemsTest < ApplicationSystemTestCase
  include AuthenticationHelpers

  test 'should highlight item after adding to cart' do
    visit store_index_url

    assert has_no_css? '.line-item-highlight'

    click_on 'Add to Cart', match: :first
    sleep 1

    assert has_css? '.line-item-highlight'
  end
end
