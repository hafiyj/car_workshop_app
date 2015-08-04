class Reservation < ActiveRecord::Base
	belongs_to :workshop
	# Short the Reservation from latest to older
	default_scope -> { order(created_at: :desc) }
  	validates :workshop_id, presence: true

	before_save :upcase_car_reg_number
	validates :name, 						presence: true, length: { maximum: 50 }
	validates :contact_number, 				presence: true, length: { maximum: 11 }
	validates :car_model, 					presence: true, length: { maximum: 15 }
	validates :car_reg_number, 				presence: true, length: { maximum: 10 }
	validates :service_type, 				presence: true
	validates :time, 						presence: true
	validates :date, 						presence: true
	validates :service_type, 				presence: true
	validates :time, 						presence: true
	validates :date, 						presence: true
	validate :present_date


	# It returns the Reservation
  def self.search(query)
    # where(:id, query) -> This would return an exact match of the query
    where("car_reg_number like ?", "%#{query}%")
  end

	def present_date
    errors.add(:date, "can't be in the past") if
		!date.blank? and date < Date.today
  end

	private

	def upcase_car_reg_number
		self.car_reg_number = car_reg_number.upcase
	end
end
