class ReservationsController < ApplicationController
	before_action :logged_in_workshop, only: [:index, :show, :create, :destroy, :edit, :update]

	def new
		@reservation = current_workshop.reservations.build
	end

	def index
		if params[:search]
			@reservation = current_workshop.reservations.where(car_reg_number: params[:search])
		else
			@reservation = current_workshop.reservations
		end
	end

	def show
		@reservation = current_workshop.reservations.find(params[:id])
	end

	def create
     @reservation = current_workshop.reservations.build(reserve_params)
      if @reservation.save
      	@client = Twilio::REST::Client.new ENV["acc_SID"],
				ENV["auth_token"]
				@client.messages.create(
  				from: ENV["twi_from"],
  				to: ENV["twi_to"],
  				body: "Thank You for choosing us for your car maintainence. \n Here is the details for your reservation: \n ID: #{@reservation.id} \n Name: #{@reservation.name} \n Ph Number: #{@reservation.contact_number} \n Car Model: #{@reservation.car_model} \n Car Plate: #{@reservation.car_reg_number} \n Service Type: #{@reservation.service_type} \n Time: #{@reservation.time.strftime('%I:%M %P')} \n Date: #{@reservation.date} \n Enjoy more mileage with the new primax95 from Petronas. \n Have a good day!"
					)
				flash[:success] = "Reservation made."
				redirect_to @reservation
    	else
      	render 'new'
      end
    end

	def edit
		@reservation = current_workshop.reservations.find(params[:id])
	end

	def update
    @reservation = current_workshop.reservations.find(params[:id])
    	if @reservation.update_attributes(reserve_params)
			@client = Twilio::REST::Client.new ENV["acc_SID"],
			ENV["auth_token"]
			@client.messages.create(
				from: ENV["twi_from"],
				to: ENV["twi_to"],
				body: "Thank You for choosing us for your car maintainence.\n Here is the details for your reservation: \n ID: #{@reservation.id} \n Name: #{@reservation.name} \n Ph Number: #{@reservation.contact_number} \n Car Model: #{@reservation.car_model} \n Car Plate: #{@reservation.car_reg_number} \n Service Type: #{@reservation.service_type} \n Time: #{@reservation.time.strftime('%I:%M %P')} \n Date: #{@reservation.date} \n Enjoy more mileage with the new primax95 from Petronas. \n Have a good day!"
				)
      		flash[:success] = "Reservation updated"
			redirect_to @reservation
    	else
      		render 'edit'
    	end
  	end

  	def destroy
  		Reservation.find(params[:id]).destroy
  		flash[:success]= "Reservation deleted!"
  		redirect_to root_url
  	end

  private

    def reserve_params
      params.require(:reservation).permit(:name, :contact_number, :car_model,:car_reg_number, :service_type,
                                   				:time, :date)
    end

	def correct_workshop
		@reservation = current_workshop.microposts.find_by(id: params[:id])
		redirect_to root_url if @reservation.nil?
	end
end
