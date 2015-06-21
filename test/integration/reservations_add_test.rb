# require 'test_helper'

# class ReservationsAddTest < ActionDispatch::IntegrationTest
#   test "invalid reservation information" do
#     get reservation_path
#     assert_no_difference 'Reservation.count' do
#       post reservations_path, reservation: { name:  "Example",
#                                contact_number:      "011-1111121",
#                                car_model:           "Sample Car",
#                                car_reg_number:      "Wet69",
#                                service_type:        "Minor",
#                                time:                "03:00AM" ,
#                                date:                "12-11-2015"}
#     end
#     assert_template 'reservation/new'
#   end
# end
