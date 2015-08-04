require 'test_helper'

class ReservationsIndexTest < ActionDispatch::IntegrationTest
  
  def setup
  	@workshop = workshops(:workshop1)
  end

  test 'index including pagiantion' do
  	log_in_as(@workshop)
  	get reservations_path
  	assert_template 'reservations/index'
  	# assert_select 'div.pagination'
  	# Reservation.paginate(page: 1).each do |reservation|
   #    assert_select 'a[href=?]', reservation_path(reservation), text: reservation.name
  	# end
  end
end
