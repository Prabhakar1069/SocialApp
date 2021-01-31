class FriendshipsController < ApplicationController
  def index
    # byebug
    @friend1 = Friendship.where(sent_to_id: current_user ,status: true)
    @friend2 = Friendship.where(sent_by_id: current_user ,status: true)
    @pending = Friendship.where(sent_to_id: current_user,status: false)

  end 
  def new
    @friend = Friendship.new

  end  

  def show
    
    @friend = User.find(params[:id])

  end
  def create
    @rec=User.find(params[:user_id])
    @ff=Friendship.find_by(sent_by_id:current_user,sent_to_id:@rec,status:false)
    
		if @ff
			redirect_to user_friendships_path
		else
      @friendrequest=Friendship.new
      @friendrequest.sent_by_id=current_user.id
			@friendrequest.sent_to_id=@rec.id
      
      @friendrequest.status = false
      # byebug
      if @friendrequest.save
        # byebug
				flash[:notice]="Friend request send succesfully"
				redirect_to user_friendships_path
			else
				flash[:notice]="Friend request does not send"
				redirect_to user_friendships_path
			end
		end

  end

  def friendrequest
   
    
  end 
  def accept
    
		@send=User.find(params[:id])
    @ff=Friendship.find_by(sent_by_id:@send,sent_to_id:current_user,status:false)
    # byebug
    @ff.status=true
    
		if @ff.save
			flash[:notice]="Successfully Added Friend"
			redirect_to search_list_path
		else
			flash[:notice]="Not Addded"
			redirect_to search_list_path
		end
	end

	def destroy
		@send=User.find(params[:user_id])
		@rec=User.find(params[:id])
		@ff=Friendship.find_by(sent_by_id:@send,sent_to_id:@rec,status:true)
    @ff.destroy
    @ff2 = Friendship.find_by(sent_by_id:@rec,sent_to_id:@send,status:true)
    @ff1.destroy
    redirect_to @rec
    
    
	end

  

  
    
end
