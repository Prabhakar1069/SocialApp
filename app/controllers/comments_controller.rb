class CommentsController < ApplicationController
  def index
    # byebug
    @post = Post.find(params[:post_id])
    @comment = @post.comments
    
    
  end  
  def new
    # byebug
    
    @comment = Comment.new
    @p = params[:post_id]
  end

  def create
    # byebug
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    # @comment.post_id = Post.find(params[:post_id])
    

    
    
    # @post.post_id = :post_id
    @comment.user = current_user  
   

    if @comment.save   
      flash[:notice] = 'Comment added!'   
      redirect_to post_path(@post)  
    else   
      flash[:error] = 'Failed to add comment!'   
      render :new 
    end
  end

  def comment_params   
    params.require(:comment).permit(:content)  
  end  

end
