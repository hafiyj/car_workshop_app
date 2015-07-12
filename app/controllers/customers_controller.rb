class CustomersController < ApplicationController
  
  def index
    @reservation = Reservation.all
  end
  
  def show
    @reservation = Reservation.find(params[:id])
  end
  
  def create
    @reservation = Reservation.new(reserve_params)
    @reservation.save
  end
  
  private
  
    def reserve_params
      params.require(:reservation).permit(:name,:contact_number,:car_model,:car_reg_number,
                                          :service_type,:time,:date)
    end
end

