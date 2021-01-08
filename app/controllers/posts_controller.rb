class PostsController < ApplicationController
  before_action :logged_in_user

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
    @post.user_id = current_user.id #this line is where user is added
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

  ## method to create new vote for a post
  def vote
    @post = Post.find(params[:id])
    vote = Vote.create(post_id: @post.id, user_id: current_user.id, vote: params[:vote])
    vote.save
  end

  private

  # Only allow user to enter title and url for post

  def post_params
    params.require(:post).permit(:title, :url, :user_id)
  end


end
