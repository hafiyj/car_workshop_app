class ReservationsController < ApplicationController

	def new
		@reservation = Reservation.new
	end

	def index
		@reservation = Reservation.all
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
  				body: '#{:name}'
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
