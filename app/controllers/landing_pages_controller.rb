class LandingPagesController < ApplicationController
  def home
    @reservation = Reservation.all
  end

  def about
  end

  def contact
  end

  def help
  end
end
