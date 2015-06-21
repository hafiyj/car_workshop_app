class WorkshopsController < ApplicationController
  def show
    # @workshop = Workshop.find(params[:id])
  end

  def new
    @workshop = Workshop.new
  end

end
