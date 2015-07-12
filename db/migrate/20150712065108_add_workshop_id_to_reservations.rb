class AddWorkshopIdToReservations < ActiveRecord::Migration
  def change
    add_reference :reservations, :workshop, index: true, foreign_key: true
    add_index :reservations, [:workshop_id, :created_at]
  end
end
