class CustomersController < ApplicationController
  
  def index
    @reservation = Reservation.all
  end
  
  def show
    @reservation = Reservation.find(params[:id])
  end
end
