class LikesController < ApplicationController
  # before_action :find_like, only: [:destroy]
  def new
    @like = Like.new
  end  
  
  def create
    
    @subject = Post.find(params[:post_id])
    
    return unless @subject

    if already_liked?
      dislike
    else
      @like = @subject.likes.build(user_id: current_user.id)
      if @like.save
        flash[:success] = "Post liked!"
        
      else
        flash[:danger] = "like failed!"
      end
      redirect_to posts_path
    end
    
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to posts_path
  end
  

  private
    
  def dislike
    @like = Like.find_by(post_id: params[:post_id]) 
    # @like = Like.find_by(comment_id: params[:comment_id]) if type == 'comment'
    return unless @like

    @like.destroy
    redirect_to posts_path
  end

  def already_liked?
    result = false
   
      result = Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
      
    
    
      # result = Like.where(user_id: current_user.id, comment_id:
      # params[:comment_id]).exists?
    

    result
  end
end
