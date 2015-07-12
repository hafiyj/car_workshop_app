class WorkshopMailer < ApplicationMailer

  def account_activation(workshop)
    @workshop = workshop
    mail to: workshop.email, subject: "Account activation"
  end

  def password_reset(workshop)
    @workshop = workshop
    mail to: workshop.email, subject: "Password reset"
  end
end
