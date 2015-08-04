require 'test_helper'

class ReservationsControllerTest < ActionController::TestCase

  def setup
    @workshop 		= workshops(:workshop1)
    @other_workshop = workshops(:workshop2)
    @reservation 	= reservations(:Ali)
  end

  test "should get new" do
    log_in_as(@workshop)
    get :new
    assert_response :success
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Reservation.count' do
      delete :destroy, id: @workshop
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a other_workshop" do
    log_in_as(@other_workshop)
    assert_difference 'Reservation.count', -1 do
      delete :destroy, id: @reservation
    end
    assert_redirected_to root_url
  end
end
