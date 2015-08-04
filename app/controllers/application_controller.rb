class ApplicationController < ActionController::Base

	require 'googlecharts'
	
	protect_from_forgery with: :exception
	include SessionsHelper

	private
	# Confirms a logged-in user.
	def logged_in_workshop
		unless logged_in?
			store_location
			flash[:danger] = "Please log in."
			redirect_to login_url
		end
	end
end
