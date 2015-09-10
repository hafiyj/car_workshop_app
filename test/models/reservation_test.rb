require 'test_helper'

class ReservationTest < ActiveSupport::TestCase

  def setup
    @workshop = workshops(:workshop1)
    @reservation = @workshop.reservations.build(name: "Example cust", contact_number: "012-6654678", car_model: "Myvi", car_reg_number: "MMM 111",
  									service_type: "Minor", time: "09.00AM", date: "12/12/2015")
  end

  test 'should be valid' do
  	assert @reservation.valid?
  end

  test 'name should be present' do
  	@reservation.name = "        "
  	assert_not @reservation.valid?
  end

  test 'contact_number should be present' do
  	@reservation.contact_number = "         "
  	assert_not @reservation.valid?
  end

  test 'car_model should be present' do
  	@reservation.car_model = "     "
  	assert_not @reservation.valid?
  end

  test 'car_reg_number should be present' do
  	@reservation.car_reg_number = "     "
  	assert_not @reservation.valid?
  end

  test 'service_type should be present' do
  	@reservation.service_type = "    "
  	assert_not @reservation.valid?
  end

  test 'time should be present' do
  	@reservation.time = "     "
  	assert_not @reservation.valid?
  end

  test 'date should be present' do
  	@reservation.date = "    "
  	assert_not @reservation.valid?
  end

  test "name should not be too long" do
    @reservation.name = "a" * 51
    assert_not @reservation.valid?
  end

  test "contact_number should not be too long" do
  	@reservation.contact_number = " " * 16
  	assert_not @reservation.valid?
  end

  test "car model should not be too long" do
  	@reservation.car_model = "a" * 16
  	assert_not @reservation.valid?
  end

  test "car reg number should not be too long" do
  	@reservation.car_reg_number = "a" * 11
  	assert_not @reservation.valid?
  end

end
