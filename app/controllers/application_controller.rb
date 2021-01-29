class ApplicationController < ActionController::Base
  before_action :authenticate_user!
    
  protect_from_forgery with: :exception

	before_action :configure_permitted_parameters, if: :devise_controller?
	
	# helper_method :current_user
  # helper_method :logged_in? 

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password)}

      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password)}
		 end
		 
	# def current_user    
	# 	User.find_by(id: session[:user_id])  
	# end	 

	# def logged_in?
  #   !current_user.nil?  
  # end

end
