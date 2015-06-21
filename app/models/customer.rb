class Customer < ActiveRecord::Base
    validates :name, presence: true ,length: {maximum:50}
    VALID_PHONE_NUMBER = /\A01(1|2|3|4|6|7|8|9|0)\d{7,8}\z/i
    validates :contact_number, presence: true, length: {maximum:12},format:{with: VALID_PHONE_NUMBER}, uniqueness: true
    validates :car_model, presence: true, length: {maximum: 15}
    validates :car_reg_number, presence: true, length: {maximum: 10}
    validates :service_type, presence: true

end
