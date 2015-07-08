require 'test_helper'

class ReservationEditTest < ActionDispatch::IntegrationTest
  def setup
    @reservation = reservations(:Ali)
  end

  test 'unsuccessful edits' do
    get edit_reservation_path(@reservation)
    assert_template 'reservations/edit'
    patch reservation_path(@reservation), reservation: {name: "  ",
                                                        contact_number: " ",
                                                        car_model: " ",
                                                        car_reg_number: " ",
                                                        service_type: " ",
                                                        time: " ",
                                                        date: " "}
    assert_template 'reservations/edit'
  end
end
