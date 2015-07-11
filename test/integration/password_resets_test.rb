require 'test_helper'

class PasswordResetsTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
    @workshop = workshops(:workshop1)
  end

  test "password resets" do
    get new_password_reset_path
    assert_template 'password_resets/new'
    # Invalid email
    post password_resets_path, password_reset: { email: "" }
    assert_not flash.empty?
    assert_template 'password_resets/new'
    # Valid email
    post password_resets_path, password_reset: { email: @workshop.email }
    assert_not_equal @workshop.reset_digest, @workshop.reload.reset_digest
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_not flash.empty?
    assert_redirected_to root_url
    # Password reset form
    workshop = assigns(:workshop)
    # Wrong email
    get edit_password_reset_path(workshop.reset_token, email: "")
    assert_redirected_to root_url
    # Inactive workshop
    workshop.toggle!(:activated)
    get edit_password_reset_path(workshop.reset_token, email: workshop.email)
    assert_redirected_to root_url
    workshop.toggle!(:activated)
    # Right email, wrong token
    get edit_password_reset_path('wrong token', email: workshop.email)
    assert_redirected_to root_url
    # Right email, right token
    get edit_password_reset_path(workshop.reset_token, email: workshop.email)
    assert_template 'password_resets/edit'
    assert_select "input[name=email][type=hidden][value=?]", workshop.email
    # Invalid password & confirmation
    patch password_reset_path(workshop.reset_token),
          email: workshop.email,
          workshop: { password:              "foobaz",
                  password_confirmation: "barquux" }
    assert_select 'div#error_explanation'
    # Empty password
    patch password_reset_path(workshop.reset_token),
          email: workshop.email,
          workshop: { password:              "",
                  password_confirmation: "" }
    assert_not flash.empty?
    assert_template 'password_resets/edit'
    # Valid password & confirmation
    patch password_reset_path(workshop.reset_token),
          email: workshop.email,
          workshop: { password:              "foobaz",
                  password_confirmation: "foobaz" }
    assert is_logged_in?
    assert_not flash.empty?
    assert_redirected_to root_path
  end
end
