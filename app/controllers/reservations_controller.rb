class ReservationsController < ApplicationController

	def new
		@reservation = Reservation.new
	end

	def index

	end

	def create
     @reservation = Reservation.new(reserve_params)    
      if @reservation.save
      	# Handle a successful save.
    	else
      	render 'new'
      end
    end

    private

    def reserve_params
      params.require(:reservation).permit(:name, :contact_number, :car_model, :car_reg_number, :service_type,
                                   :time, :date)
    end
end