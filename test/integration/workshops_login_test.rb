require 'test_helper'

class WorkshopsLoginTest < ActionDispatch::IntegrationTest

  def setup
    @workshop = workshops(:workshop1)
  end

  test "login with valid information" do
    get login_path
    post login_path, session: { email: @workshop.email, password: 'password' }
    assert is_logged_in?
    assert_redirected_to root_path
    follow_redirect!
    assert_template 'landing_pages/home'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", signup_path, count: 0
    assert_select "a[href=?]", logout_path
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, session: { email: @workshop.email, password: 'password' }
    assert is_logged_in?
    assert_redirected_to root_path
    follow_redirect!
    assert_template 'landing_pages/home'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", signup_path, count: 0
    assert_select "a[href=?]", logout_path

    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_path

    delete logout_path
    follow_redirect!

    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", workshop_path(@workshop), count: 0
  end

  test "login with remembering" do
    log_in_as(@workshop, remember_me: '1')
    assert_not_nil cookies['remember_token']
  end

  test "login without remembering" do
    log_in_as(@workshop, remember_me: '0')
    assert_nil cookies['remember_token']
  end
end
