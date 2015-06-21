class AddIndexToReservationsCarRegNumber < ActiveRecord::Migration
  def change
  	add_index :reservations, :car_reg_number, unique: true
  end
end
