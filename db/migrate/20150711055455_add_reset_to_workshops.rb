class AddResetToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :reset_digest, :string
    add_column :workshops, :reset_sent_at, :datetime
  end
end
