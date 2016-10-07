module UserControllersHelper
	def current_user
		@user = @user || User.find_by(username: session[:user_id])
	end
end