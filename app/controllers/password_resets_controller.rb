class PasswordResetsController < ApplicationController
  before_action :get_workshop,   only: [:edit, :update]
  before_action :valid_workshop, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @workshop = Workshop.find_by(email: params[:password_reset][:email].downcase)
    if @workshop
      @workshop.create_reset_digest
      @workshop.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:workshop][:password].empty?
      flash.now[:danger] = "Password can't be empty"
      render 'edit'
    elsif @workshop.update_attributes(workshop_params)
      log_in @workshop
      flash[:success] = "Password has been reset."
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

    def workshop_params
      params.require(:workshop).permit(:password, :password_confirmation)
    end

    def get_workshop
      @workshop = Workshop.find_by(email: params[:email])
    end

    def valid_workshop
      unless (@workshop && @workshop.activated? &&
              @workshop.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

    def check_expiration
      if @workshop.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end
end
