class RemoveIndexFromReservationsCarRegNumber < ActiveRecord::Migration
  def change
    remove_index :reservations, :car_reg_number
  end
end
