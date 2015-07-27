require 'test_helper'

class WorkshopsControllerTest < ActionController::TestCase

  def setup
    @workshop = workshops(:workshop1)
    @another_workshop = workshops(:workshop2)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect index when not logged in" do
    get :index
    assert_redirected_to login_url
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @workshop
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    get :update, id: @workshop, workshop: { name: @workshop.name, email: @workshop.email }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@another_workshop)
    get :edit, id: @workshop
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@another_workshop)
    patch :update, id: @workshop, workshop: { name: @workshop.name, email: @workshop.email }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Workshop.count' do
      delete :destroy, id: @workshop
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@another_workshop)
    assert_no_difference 'Workshop.count' do
      delete :destroy, id: @workshop
    end
    assert_redirected_to root_url
  end

  test "should not allow the admin attribute to be edited via the web" do
    log_in_as(@another_workshop)
    assert_not @another_workshop.admin?
    patch :update, id: @another_workshop, workshop: { password: Workshop.digest('password'),
                                                      password_confirmation: Workshop.digest('password'),
                                                      admin: false }
    assert_not @another_workshop.reload.admin?
  end
end
