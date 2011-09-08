class PostsController < ApplicationController
  before_filter :find_post, :only => [:edit, :update, :show, :destroy]
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to posts_path
    else
      render :action => "new"
    end
  end
  
  def edit
  end
  
  def update
    if @post.update_attributes(params[:post])
      redirect_to post_path(@post)
    else
      render :action => "edit"
    end
  end
  
  def show
  end
  
  def destroy
    @post.destroy
    redirect_to posts_path
  end
  
  protected
  
  def find_post
    @post = Post.find(params[:id])
  end
end
