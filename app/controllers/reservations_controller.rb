class ReservationsController < ApplicationController

	def new
		@reservation = Reservation.new
	end

	def index
		if params[:search]
			@reservation = Reservation.search(params[:search])
		else
			@reservation = Reservation.all
		end
	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	def create
     @reservation = Reservation.new(reserve_params)
      if @reservation.save
      	@client = Twilio::REST::Client.new ENV["acc_SID"],
				ENV["auth_token"]
				@client.messages.create(
  				from: '+1 415-599-2671',
  				to: '+60182060472',
  				body: "Thank You for contacting us. \n Name: #{@reservation.name} \n Ph Number: #{@reservation.contact_number} \n Car Model: #{@reservation.car_model} \n Car Plate: #{@reservation.car_reg_number} \n Service Type: #{@reservation.service_type} \n Time: #{@reservation.time.strftime('%I:%M %P')} \n Date: #{@reservation.date} \n"
					)
				flash[:success] = "Reservation made."
				redirect_to @reservation
    	else
      	render 'new'
      end
    end

		def edit
			@reservation = Reservation.find(params[:id])
		end

		def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes(reserve_params)
			@client = Twilio::REST::Client.new ENV["acc_SID"],
			ENV["auth_token"]
			@client.messages.create(
				from: '+1 415-599-2671',
				to: '+60182060472',
				body: "Thank You for contacting us. \n Name: #{@reservation.name} \n Ph Number: #{@reservation.contact_number} \n Car Model: #{@reservation.car_model} \n Car Plate: #{@reservation.car_reg_number} \n Service Type: #{@reservation.service_type} \n Time: #{@reservation.time.strftime('%I:%M %P')} \n Date: #{@reservation.date} \n"
				)
      flash[:success] = "Reservation updated"
			redirect_to @reservation
    else
      render 'edit'
    end
  end

    private

    def reserve_params
      params.require(:reservation).permit(:name, :contact_number, :car_model,
																					:car_reg_number, :service_type,
                                   				:time, :date)
    end
end
