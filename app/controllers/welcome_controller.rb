class WelcomeController < ApplicationController
  def index
    # puts params[:id]
    
    # @username = User.find(@user).username
    render "index"
  end
end
