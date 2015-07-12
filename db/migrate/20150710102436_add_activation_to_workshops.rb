class AddActivationToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :activation_digest, :string
    add_column :workshops, :activated, :boolean, default: false
    add_column :workshops, :activated_at, :datetime
  end
end
