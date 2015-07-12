# Preview all emails at http://localhost:3000/rails/mailers/workshop_mailer
class WorkshopMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/workshop_mailer/account_activation
  def account_activation
    workshop = Workshop.first
    workshop.activation_token = Workshop.new_token
    WorkshopMailer.account_activation(workshop)
  end

  # Preview this email at http://localhost:3000/rails/mailers/workshop_mailer/password_reset
  def password_reset
    workshop = workshop.first
    workshop.reset_token = Workshop.new_token
    WorkshopMailer.password_reset(workshop)
  end

end
