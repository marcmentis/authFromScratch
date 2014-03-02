class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
  # Create a curren_user method to be able to access the current user 
  	# through the given session
  private
    def current_user
    	@current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def authorize
        redirect_to new_session_url, notice: "Not Authorized" if current_user.nil?
      end  


end
