class Reservation < ActiveRecord::Base
	before_save :upcase_car_reg_number
	validates :name, 			presence: true, length: { maximum: 50 }
	validates :contact_number, 	presence: true, length: { maximum: 11 }
	validates :car_model, 		presence: true, length: { maximum: 15 }
	validates :car_reg_number, 	presence: true, length: { maximum: 10 },
	           uniqueness: { case_sensitive: false}
	validates :service_type, 	presence: true
	validates :time, 			presence: true
	validates :date, 			presence: true

	# It returns the articles whose titles contain one or more words that form the query
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("car_reg_number like ? OR date like ? OR id like ?", "%#{query}%",
																									"%#{query}%", "%#{query}%" )
  end

	private

	def upcase_car_reg_number
		self.car_reg_number = car_reg_number.upcase
	end
end
