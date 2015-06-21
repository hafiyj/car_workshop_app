class Workshop < ActiveRecord::Base
  validates :name, presence: true
  
end
