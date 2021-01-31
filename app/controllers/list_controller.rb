class ListController < ApplicationController
  def sentrequest
    
  end  
  def search

    if params[:search].blank?  
      redirect_to(sent_friendrequests_path(current_user), alert: "Accepted") and return  
    else
      @parameter = params[:search].downcase  
      @results = User.all.where("lower(username) LIKE :search", search: @parameter)
      @flag = []  
      @results.each do |res|
        first = Friendship.all.where(sent_by_id: res.id,sent_to_id: current_user.id,status: true)
        second =  Friendship.all.where(sent_by_id: current_user.id,sent_to_id: res.id,status: true)
        if first.count==1 or second.count==1
          result = 1
        else
          result = 0
        end
        # byebug
        @flag << result    
      end
      # byebug
    end  
  end  
  def friend
    
    @friend  = User.all
    
  end
end
