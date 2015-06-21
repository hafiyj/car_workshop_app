class AddIndexToWorkshopsEmail < ActiveRecord::Migration
  def change
    add_index :workshops, :email, unique: true
  end
end
