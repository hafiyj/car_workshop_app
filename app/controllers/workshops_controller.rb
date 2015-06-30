class WorkshopsController < ApplicationController
  
  def show
  	@workshop = Workshop.find(params[:id])
  end

  def new
  	@workshop = Workshop.new
  end

  def create
  	@workshop = Workshop.new(workshop_params)
  	if @workshop.save
  		flash[:success] = "Welcome to CarServIt!"
  		redirect_to @workshop
  	else
  		render 'new'
  	end

  end

  private

  	def workshop_params
  		params.require(:workshop).permit(:com_reg_num, :name, :email, :address,
  																			:contact_num, :password, :password_confirmation)
  	end
end
