class PostsController < ApplicationController

  before_filter :current_post, :only => [:show, :edit, :update]

  def new
    @new_post = Post.new
  end

  def create
    @new_post = Post.new(params[:post])
    if @new_post.save
      redirect_to essays_path
    else
      render 'new'
      flash[:error] = "Something went wrong."
    end
  end

  def show
    # @post = Post.find(params[:id])
  end

  def edit
  end

  def update
    if @post.update_attributes(params[:post])
      flash[:success] = 'Post updated'
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  private

  def current_post
    @post = Post.find(params[:id])
  end

end
