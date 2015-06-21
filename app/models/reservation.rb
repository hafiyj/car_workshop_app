class Reservation < ActiveRecord::Base
	validates :name, 			presence: true
	validates :contact_number, 	presence: true
	validates :car_model, 		presence: true
	validates :car_reg_number, 	presence: true
	validates :service_type, 	presence: true
	validates :time, 			presence: true
	validates :date, 			presence: true
end
