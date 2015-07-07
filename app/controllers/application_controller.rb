class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception
	include SessionsHelper

	# def acc_SID
	# 	@acc_SID = ENV["acc_SID"]
	# end
	#
	# def auth_token
	# 	@auth_token = ENV["auth_token"]
	# end
end
