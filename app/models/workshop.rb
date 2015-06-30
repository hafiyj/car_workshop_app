class Workshop < ActiveRecord::Base
  before_save { email.downcase!}
  before_save { com_reg_num.upcase!}

  validates :name, presence: true, length: { maximum: 100 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  VALID_CONTACT_REGEX = /\A0\d{1}\d{7,8}\z/i
  validates :contact_num, presence: true, length: { maximum: 11 },
             format: { with: VALID_CONTACT_REGEX }
  validates :address, presence: true, length: { maximum: 500 }
  validates :com_reg_num, presence: true, length: { maximum: 15 }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def Workshop.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
end
