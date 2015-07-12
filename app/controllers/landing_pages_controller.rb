class LandingPagesController < ApplicationController
  def home
    if logged_in?
      @reservation = current_workshop.reservations
    end
  end

  def about
  end

  def contact
  end

  def help
  end
end
