class Reservation < ActiveRecord::Base
	belongs_to :workshop
	# Short the Reservation from latest to older
	default_scope -> { order(created_at: :desc) }
  validates :workshop_id, presence: true

	before_save :upcase_car_reg_number
	validates :name, 			presence: true, length: { maximum: 50 }
	validates :contact_number, 	presence: true, length: { maximum: 11 }
	validates :car_model, 		presence: true, length: { maximum: 15 }
	validates :car_reg_number, 	presence: true, length: { maximum: 10 }
	validates :service_type, 	presence: true
	validates :time, 			presence: true
	validates :date, 			presence: true

	# It returns the Reservation
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("id like ?", "%#{query}%")
  end

	private

	def upcase_car_reg_number
		self.car_reg_number = car_reg_number.upcase
	end
end
