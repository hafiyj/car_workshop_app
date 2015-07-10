require 'test_helper'

class WorkshopsSignupTest < ActionDispatch::IntegrationTest

  def setup
      ActionMailer::Base.deliveries.clear
  end

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'Workshop.count' do
      post workshops_path, workshop: { 	name: 	 								"",
		                               			email: 									"user@invalid",
		                               			com_reg_num: 						"R123",
		                               			address: 								"Kuala Lumpur",
		                               			contact_num: 						"038888",
		                               			password:              	"foo",
		                               			password_confirmation: 	"bar" }
    end
    assert_template 'workshops/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'Workshop.count', 1 do
      post workshops_path, workshop: {name: 	 								"Example Workshop",
	                               			email: 									"example@workshops.com",
	                               			com_reg_num: 						"R1234567890",
	                               			address: 								"Lot 10, Jalan Lok Yew,
	                               															 53000 Kuala Lumpur, WP",
	                               			contact_num: 						"0389912345",
	                               			password:              	"password",
	                               			password_confirmation: 	"password" }
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    workshop = assigns(:workshop)
    assert_not workshop.activated?
    # Try to log in before activation.
    log_in_as(workshop)
    assert_not is_logged_in?
    # Invalid activation token
    get edit_account_activation_path("invalid token")
    assert_not is_logged_in?
    # Valid token, wrong email
    get edit_account_activation_path(workshop.activation_token, email: 'wrong')
    assert_not is_logged_in?
    # Valid activation token
    get edit_account_activation_path(workshop.activation_token, email: workshop.email)
    assert workshop.reload.activated?
    follow_redirect!
    assert_template root_path
    assert is_logged_in?
  end

end
