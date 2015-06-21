class AddPasswordDigestToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :password_digest, :string
  end
end
