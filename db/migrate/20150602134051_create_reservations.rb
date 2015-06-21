class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :contact_number
      t.string :car_model
      t.string :car_reg_number
      t.string :service_type
      t.time :time
      t.date :date

      t.timestamps null: false
    end
  end
end
