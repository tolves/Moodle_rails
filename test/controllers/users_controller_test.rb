require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:foo)
    get new_user_session_path
    sign_in @user
  end

  test 'log in & browse' do
    visit root_path
    logout @user
  end

  private

  def logout(user)
    delete destroy_user_session_path
    assert_redirected_to root_path
  end

  def visit(path)
    get path
    assert_select 'p', text: 'welcome index'
    assert_equal 200, status
    assert_select 'a[href=?]', destroy_user_session_path
  end

  # test 'Log in & Browse' do
  #   get "/users"
  #   assert_redirected_to new_user_session_path
  #   # get the login page
  #   get "/users/sign_in"
  #   assert_equal 200, status
  #   # post the login and follow through to the home page
  #   # post '/users/sign_in', params: { email: users(:alice).email, password: 'password' }
  #   # assert_select "a[href=?]", destroy_user_session_path
  #   sign_in users(:alice)
  #   puts response.flashes
  #   delete destroy_user_session_path
  #   assert_equal 302, status
  #   assert_redirected_to root_path
  #   # puts response.body
  #
  #   post user_session_path, params: { email: users(:alice).email, password: 111 }
  #   # puts response.body
  # end
end
