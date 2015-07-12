class Customer < ActiveRecord::Base
    before_save {self.car_reg_number = car_reg_number.downcase}
    validates :name, presence: true ,length: {maximum:50}
    # VALID_PHONE_NUMBER = /\A01(1|2|3|4|6|7|8|9|0)\d{7,8}\z/i
    validates :contact_number, presence: true, length: {maximum:15}
    # ,format:{with: VALID_PHONE_NUMBER}
    validates :car_model, presence: true, length: {maximum: 15}
    validates :car_reg_number, presence: true, length: {maximum: 10}, uniqueness: {case_sensitive: false}
    validates :service_type, presence: true
    validates :time, presence: true
    validates :date, presence: true
end
