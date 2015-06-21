class Workshop < ActiveRecord::Base
  before_save { self.email = email.downcase, 
                self.com_reg_num = com_reg_num.upcase }
                
  validates :name, presence: true, length: { maximum: 100 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, 
            format: { with: VALID_EMAIL_REGEX }, 
            uniqueness: { case_sensitive: false }
  validates :contact_num, presence: true, length: { maximum: 11 }
  validates :address, presence: true, length: { maximum: 500 }
  validates :com_reg_num, presence: true, length: { maximum: 15 }
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
