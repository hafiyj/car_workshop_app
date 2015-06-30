class CustomersController < ApplicationController
  def new
  end
  
  def index
    @customers = User.all
  end
end
