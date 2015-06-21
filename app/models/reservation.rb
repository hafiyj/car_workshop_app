class Reservation < ActiveRecord::Base
	before_save {self.car_reg_number = car_reg_number.downcase }
	validates :name, 			presence: true, length: { maximum: 50 }
	validates :contact_number, 	presence: true, length: { maximum: 15 }
	validates :car_model, 		presence: true, length: { maximum: 15 }
	validates :car_reg_number, 	presence: true, length: { maximum: 10 }, uniqueness: { case_sensitive: false}
	validates :service_type, 	presence: true
	validates :time, 			presence: true
	validates :date, 			presence: true
end
