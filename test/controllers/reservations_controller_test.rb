require 'test_helper'

class ReservationsControllerTest < ActionController::TestCase

  def setup
    @workshop = workshops(:workshop1)
  end

  test "should get new" do
    log_in_as(@workshop)
    get :new
    assert_response :success
  end

end
