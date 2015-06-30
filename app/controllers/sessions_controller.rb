class SessionsController < ApplicationController
  def new

  end

  def create
    workshop = Workshop.find_by(email: params[:session][:email].downcase)
    if workshop && workshop.authenticate(params[:session][:password])
      log_in workshop
      redirect_to workshop
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
