class PostsController < ApplicationController
  before_action :logged_in_user
  before_action :set_post, only: [:show, :vote]

  def index
    if params[:sort] == "recent"
    @posts = Post.order(created_at: :desc)
    elsif
      params[:sort] == "top"
      @posts = Post.all.sort { |a, b| b.vote_points <=> a.vote_points  }
    elsif 
      params[:sort] == "hot"
      @posts = Post.all.order(created_at: :desc).sort { |a, b| b.vote_points <=> a.vote_points  }
    else
      @posts = Post.all.order(created_at: :asc).sort { |a, b| b.vote_points <=> a.vote_points  }
    end
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
    ## find and check if vote exists
    vote = Vote.find_by(voteable: @post, user_id: current_user.id)
    if vote
      vote.update(vote: params[:vote])
      flash[:notice] = "Voted!"
    else
     Vote.create(voteable: @post, user_id: current_user.id, vote: params[:vote])
    flash[:notice] = "Thanks for your new vote!"
    end
  end


  private

  # Only allow user to enter title and url for post

  def post_params
    params.require(:post).permit(:title, :url, :user_id)
  end


  def set_post
    @post = Post.find(params[:id])
  end


end
