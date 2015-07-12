class WorkshopsController < ApplicationController
  before_action :logged_in_workshop, only: [:show, :index, :edit, :update, :destroy]
  before_action :correct_workshop,   only: [:show, :edit, :update]
  before_action :admin_workshop,     only: [:destroy, :index]

  def index
    @workshops = Workshop.paginate(page: params[:page])
  end

  def show
  	@workshop = Workshop.find(params[:id])
  end

  def new
  	@workshop = Workshop.new
  end

  def create
  	@workshop = Workshop.new(workshop_params)
  	if @workshop.save
      @workshop.send_activation_email
      flash[:info] = "Welcome to CarServIt, please check your email to activate your account."
      redirect_to root_path
  	else
  		render 'new'
  	end

  end

  def edit
    @workshop = Workshop.find(params[:id])
  end

  def update
    @workshop = Workshop.find(params[:id])
    if @workshop.update_attributes(workshop_params)
      flash[:success] = "Workshop profile updated"
      redirect_to current_workshop
    else
      render 'edit'
    end
  end

  def destroy
    Workshop.find(params[:id]).destroy
    flash[:success] = "Workshop Profile deleted"
    redirect_to workshops_url
  end

  private

  	def workshop_params
  		params.require(:workshop).permit(:com_reg_num, :name, :email, :address,
  																			:contact_num, :password, :password_confirmation)
  	end

    # Only Correct Workshop (Itself) can view the Profile, And also Admin.
    def correct_workshop
      @workshop = Workshop.find(params[:id])
      redirect_to(root_url) unless current_workshop?(@workshop) || current_workshop.admin?
    end


    def admin_workshop
      redirect_to(root_url) unless current_workshop.admin?
    end
end
