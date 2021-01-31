class PostsController < ApplicationController
  load_and_authorize_resource

  def index
      user_p = []
     current_user.posts.each do |p|
        user_p << p
     end 
    # byebug
    friend1 = Friendship.where(sent_by_id: current_user,status:true)
      
    friend2 = Friendship.where(sent_to_id: current_user,status:true)

    friend_post = []
    
     
    
    friend_id = []
    friend1.each do |f|
       friend_id << f.sent_to_id
    end 
    friend2.each do |f|
       friend_id << f.sent_by_id
    end 

    userr = []
    friend_id.each do |f|
      userr << User.find(f)
    end  
    userr.each do |f|
      f.posts.each do |p|
        user_p << p
      end  
    end  
    # byebug
    @post = user_p
   

    # byebug

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
