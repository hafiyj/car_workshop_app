require 'test_helper'

class ReservationsEditTest < ActionDispatch::IntegrationTest

  def setup
    @workshop = workshops(:workshop1)
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

  test "successful edit" do
    get edit_reservation_path(@reservation)
    assert_template 'reservations/edit'
    name           = "Ali"
    contact_number = "0192777864"
    car_model      = "Myvi"
    car_reg_number = "BEB 1"
    service_type   = "Major"
    time           = "03:00AM"
    date           = "2015-09-09"
    patch reservation_path(@reservation), reservation: { name:  name,
                                    contact_number: contact_number,
                                    car_model:      car_model,
                                    car_reg_number: car_reg_number,
                                    service_type: service_type,
                                    time: time,
                                    date: date}
    assert_not flash.empty?
    assert_redirected_to @reservation
    @reservation.reload
    assert_equal name,           @reservation.name
    assert_equal contact_number, @reservation.contact_number
    assert_equal car_model ,     @reservation.car_model
    assert_equal car_reg_number, @reservation.car_reg_number
    assert_equal service_type,   @reservation.service_type
    # assert_equal time,           @reservation.time
    # assert_equal date,           @reservation.date
  end
end
