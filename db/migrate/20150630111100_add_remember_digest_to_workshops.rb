class AddRememberDigestToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :remember_digest, :string
  end
end
