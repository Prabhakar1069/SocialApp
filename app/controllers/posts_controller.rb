class PostsController < ApplicationController
  def index
    @post = Post.all
    @user = User.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:product).permit(:content))
  end
end
