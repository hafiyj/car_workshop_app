class ChangeStringToDate < ActiveRecord::Migration
  def change
  	change_column :reservations, :date,  :date
  end
end
