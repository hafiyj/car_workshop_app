class Workshop < ActiveRecord::Base
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save   :downcase_email, :upcase_com_reg_num
  before_create :create_activation_digest

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

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  # Activates an account.
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    WorkshopMailer.account_activation(self).deliver_now
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = Workshop.new_token
    update_attribute(:reset_digest,  Workshop.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    WorkshopMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  private

    def downcase_email
      self.email = email.downcase
    end

    def upcase_com_reg_num
      self.com_reg_num = com_reg_num.upcase
    end

    def create_activation_digest
      self.activation_token  = Workshop.new_token
      self.activation_digest = Workshop.digest(activation_token)
    end
end
