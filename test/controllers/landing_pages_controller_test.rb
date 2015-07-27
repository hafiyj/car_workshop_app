require 'test_helper'

class LandingPagesControllerTest < ActionController::TestCase

  def setup
    @base_title = "CarServIt"
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact Us | #{@base_title}"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end
end
