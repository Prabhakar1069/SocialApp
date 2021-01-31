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

  def edit
    @comment = Comment.find(params[:id])
  end 
  def show
    
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

  def destroy
    @comment = Comment.find(params[:id])
    # return unless current_user.id == @post.user_id

    @comment.destroy
    flash[:success] = 'Comment deleted'
    redirect_to post_comment_path(@comment)
  end

  def update 
    @comment = Comment.find(params[:id])
    
    # byebug
    if @comment.update(content: params[:comment][:content]) 
        redirect_to post_comment_path(@comment)
        flash[:notice] = 'Comment is updated.'
    else
        render 'edit'
    end
  end 

  def comment_params   
    params.require(:comment).permit(:content)  
  end  

end
