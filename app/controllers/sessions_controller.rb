class SessionsController < ApplicationController
  force_ssl if: :ssl_configured?  # Will force https - Not sending passwords in plain text
                                  # if ssl configured i.e., production not dev environments

  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id 
  		redirect_to root_url, notice: "Logged in!"


  	else
  		flash.now[:notice] = "Invalid email or password"
  		render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"

  end

  private
    #Exclude development environment from the force_ssl command
    def ssl_configured?
      !Rails.env.development?
    end
end
