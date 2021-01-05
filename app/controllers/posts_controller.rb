class PostsController < ApplicationController
  before_filter :authorize, only: [:edit, :update]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private

  # Only allow user to enter title and url for post

  def post_params
    params.require(:post).permit(:title, :url)
  end
end
