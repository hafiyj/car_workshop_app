class LandingPagesController < ApplicationController
  def home
    if logged_in?
      @r_data = current_workshop.reservations.unscoped.
                where(workshop_id: current_workshop.id, date: Date.today).order(:time)
      @reservation = @r_data.paginate(:per_page => 10, :page => params[:page])
    end
  end

  def about
  end

  def contact
  end

  def help
  end
end
