class CommentsController < ApplicationController
  before_filter :authorize, :only => [:edit, :update, :destroy]

  def index
    @comments = Comment.recent.all
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def new
    flash[:notice] = "To submit a comment, please go to a specific post first."
    redirect_to root_url
  end
  
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to @comment.post
    else
      render :action => 'new'
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully updated comment."
      redirect_to @comment
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfully destroyed comment."
    redirect_to comments_url
  end
end
