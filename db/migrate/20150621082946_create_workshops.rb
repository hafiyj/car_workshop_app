class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :contact_num
      t.string :com_reg_num

      t.timestamps null: false
    end
  end
end
