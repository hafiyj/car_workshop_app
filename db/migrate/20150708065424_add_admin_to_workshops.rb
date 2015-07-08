class AddAdminToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :admin, :boolean, default: false
  end
end
