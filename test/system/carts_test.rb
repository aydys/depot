require 'application_system_test_case'

class CartsTest < ApplicationSystemTestCase
  include ActiveJob::TestHelper
  include AuthenticationHelpers

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

  test 'should send email notification if record not founded' do
    LineItem.delete_all
    Cart.delete_all

    visit cart_url(1)

    perform_enqueued_jobs
    assert_performed_jobs 1

    assert_text 'Invalid cart'
  end
end
