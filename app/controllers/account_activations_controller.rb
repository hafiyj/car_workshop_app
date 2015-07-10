class AccountActivationsController < ApplicationController

  def edit
    workshop = Workshop.find_by(email: params[:email])
    if workshop && !workshop.activated? && workshop.authenticated?(:activation, params[:id])
      workshop.activate
      log_in workshop
      flash[:success] = "Account activated!"
      redirect_to root_path
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
