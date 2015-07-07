class SessionsController < ApplicationController
  def new

  end

  def create
    workshop = Workshop.find_by(email: params[:session][:email].downcase)
    if workshop && workshop.authenticate(params[:session][:password])
      log_in workshop
      params[:session][:remember_me] == '1' ? remember(workshop) : forget(workshop)
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
