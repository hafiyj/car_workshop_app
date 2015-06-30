require 'test_helper'

class WorkshopsSignupTest < ActionDispatch::IntegrationTest

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
      post_via_redirect workshops_path, workshop: { name: 	 								"Example Workshop",
								                               			email: 									"example@workshops.com",
								                               			com_reg_num: 						"R1234567890",
								                               			address: 								"Lot 10, Jalan Lok Yew,
								                               															 53000 Kuala Lumpur, WP",
								                               			contact_num: 						"0389912345",
								                               			password:              	"password",
								                               			password_confirmation: 	"password" }
    end
    assert_template 'workshops/show'
    assert is_logged_in?
  end

end
