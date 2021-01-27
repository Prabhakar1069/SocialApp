class ListController < ApplicationController
  def search
    if params[:search].blank?  
      redirect_to(root_path, alert: "Empty field!") and return  
    else
      @parameter = params[:search].downcase  
      @results = User.all.where("lower(username) LIKE :search", search: @parameter)  
    end  
  end  
  def friend
    
    @friend  = User.all
    
  end
end
