class UsersController < ApplicationController
	force_ssl if: :ssl_configured?  # Will force https - Not sending passwords in plain text
                                  # if ssl configured i.e., production not dev environments

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_url, notice: "Thank you for signing up"
		else
			render "new"
		end
	end

	# Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

   #Exclude development environment from the force_ssl command
  def ssl_configured?
  	!Rails.env.development?
  end
end
