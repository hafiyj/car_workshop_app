class Workshop < ActiveRecord::Base
  attr_accessor :remember_token

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
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def Workshop.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def Workshop.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = Workshop.new_token
    update_attribute(:remember_digest, Workshop.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
