require 'test_helper'

class WorkshopsEditTest < ActionDispatch::IntegrationTest

  def setup
    @workshop = workshops(:workshop1)
  end

  test "unsuccessful edit" do
    log_in_as(@workshop)
    get edit_workshop_path(@workshop)
    assert_template 'workshops/edit'
    patch workshop_path(@workshop), workshop: { name: 	 								"",
                                                email: 									"user@invalid",
                                                address: 								"Kuala Lumpur",
                                                contact_num: 						"038888",
                                                password:              	"foo",
                                                password_confirmation: 	"bar" }
    assert_template 'workshops/edit'
  end

  test "successful edit" do
    log_in_as(@workshop)
    get edit_workshop_path(@workshop)
    assert_template 'workshops/edit'
    name = "CarServIt New"
    email = "carservit-new@gmail.com"
    address = "Lot 10, Jalan Lok Yew, 53000 Kuala Lumpur, WP"
    contact_num = "0389912345"
    patch workshop_path(@workshop), workshop: { name: 	 								name,
                                                email: 									email,
                                                address: 								address,
                                                contact_num: 						contact_num,
                                                password:              	"",
                                                password_confirmation: 	"" }
    assert_not flash.empty?
    assert_redirected_to @workshop
    @workshop.reload
    assert_equal name, @workshop.name
    assert_equal email, @workshop.email
  end

  test "successful edit with friendly forwarding" do
    get edit_workshop_path(@workshop)
    log_in_as(@workshop)
    assert_redirected_to edit_workshop_path(@workshop)
    name = "CarServIt New"
    email = "carservit-new@gmail.com"
    address = "Lot 10, Jalan Lok Yew, 53000 Kuala Lumpur, WP"
    contact_num = "0389912345"
    patch workshop_path(@workshop), workshop: { name: 	 								name,
                                                email: 									email,
                                                address: 								address,
                                                contact_num: 						contact_num,
                                                password:              	"",
                                                password_confirmation: 	"" }
    assert_not flash.empty?
    assert_redirected_to @workshop
    @workshop.reload
    assert_equal name, @workshop.name
    assert_equal email, @workshop.email
  end
end
