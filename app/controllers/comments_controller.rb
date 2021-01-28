class CommentsController < ApplicationController
  def index
    @comment = Comment.all
  end  
  def new
  end

  def create
  end
end
