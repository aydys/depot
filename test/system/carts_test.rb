require 'application_system_test_case'

class CartTest < ApplicationSystemTestCase
  test 'should reveal cart via button' do
    visit store_index_url

    assert_no_text 'Your Cart'

    click_button 'Add to Cart', match: :first

    assert_text 'Your Cart'
  end

  test 'should hide cart via Empty Cart button' do
    visit store_index_url

    click_button 'Add to Cart', match: :first

    assert_text 'Your Cart'

    click_button 'Empty Cart'

    assert_no_text 'Your Cart'
  end
end
