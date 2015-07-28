require 'test_helper'

class ReservationsAddTest < ActionDispatch::IntegrationTest

  def setup
    @workshop = workshops(:workshop1)
  end

  test "valid reservation information" do
    log_in_as(@workshop)
    get new_reservation_path
    assert_difference 'Reservation.count' do
      post_via_redirect reservations_path, reservation: {  name:  "Example",
                                                           contact_number:      "0123456789",
                                                           car_model:           "Sample Car",
                                                           car_reg_number:      "Wet69",
                                                           service_type:        "Minor",
                                                           time:                "03:00AM" ,
                                                           date:                "2015-11-05"
                                                        }
    end
    assert_template 'reservations/show'
  end

  test "invalid reservation information" do
    log_in_as(@workshop)
    get new_reservation_path
    assert_no_difference 'Reservation.count' do
      post reservations_path, reservation: { name:  " ",
                               contact_number:      " ",
                               car_model:           " ",
                               car_reg_number:      " ",
                               service_type:        " ",
                               time:                " " ,
                               date:                " "}
    end
    assert_template 'reservations/new'
  end
end
