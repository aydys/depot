require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  class UserLogIn < UsersTest
    include AuthenticationHelpers

    setup do
      @user = users(:two)
    end

    test "visiting the index" do
      visit users_url
      assert_selector "h1", text: "Users"
    end

    test "should create user" do
      visit users_url
      click_on "New user"

      fill_in "Name", with: @user.name
      fill_in "Password", with: "secret"
      fill_in "Confirm", with: "secret"
      click_on "Create User"

      assert_text "User #{@user.name} was successfully created"
    end

    test "should update User" do
      visit user_url(@user)
      click_on "Edit this user", match: :first

      fill_in "Name", with: @user.name
      fill_in "Password", with: "secret"
      fill_in "Confirm", with: "secret"
      click_on "Update User"

      assert_text "User #{@user.name} was successfully updated"
    end

    test "should destroy User" do
      visit user_url(@user)
      click_on "Destroy this user", match: :first

      assert_text "User was successfully destroyed"
    end
  end

  class UsersNotExist < UsersTest
    def setup
      User.delete_all
    end

    test 'can create user' do
      visit new_user_url

      fill_in 'Name', with: 'dave'
      fill_in 'Password', with: 'secret'
      fill_in "Confirm", with: "secret"
      click_on "Create User"

      assert_text 'Please Log In'

      fill_in 'Name', with: 'dave'
      fill_in 'Password', with: 'secret'
      click_on 'Login'

      assert_text 'Welcome'
    end
  end

  class UsersExistAndNobodyLogIn < UsersTest
    test 'should not allow create user from guest' do
      visit new_user_url

      assert_text 'Please log in'
    end
  end
end
