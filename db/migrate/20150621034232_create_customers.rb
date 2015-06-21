class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :contact_number
      t.string :car_model
      t.string :car_reg_number

      t.timestamps null: false
    end
  end
end
