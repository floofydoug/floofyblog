class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end

  private

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
		#This rescue is a hacky way to fix the fact that sometimes the user may not exist in db. Like if i clear the db. 
		rescue ActiveRecord::RecordNotFound 

	end
	helper_method :current_user
end
