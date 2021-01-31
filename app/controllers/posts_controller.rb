class PostsController < ApplicationController
  def index
    # byebug
    @post = current_user.posts
    @user = User.all
  end

  # def show
  #   # byebug
  #   @post = Post.find(params[:id])
  # end

  def new
    # byebug
    @post = Post.new
  end
  def edit
    @post = Post.find(params[:id])
  end  

  def create
    
    @post = current_user.posts.build(post_params) 
    # @post.user = current_user  
    if @post.save   
      flash[:notice] = 'Post added!'   
      redirect_to posts_path   
    else   
      flash[:error] = 'Failed to add post!'   
      render :new 
    end
  end
  def destroy
    @post = Post.find(params[:id])
    # return unless current_user.id == @post.user_id

    @post.destroy
    redirect_to post_path
    flash[:notice] = 'Post deleted'
    
  end
  def update 
    @post = Post.find(params[:id])
    
    # byebug
    if @post.update(content: params[:post][:content]) 
        redirect_to post_path
        flash[:notice] = 'post is updated.'
    else
        render 'edit'
    end
  end  

  
  
  def post_params   
    params.require(:post).permit(:content)   
  end   
end
