class PostsController < ApplicationController
  before_action :logged_in_user
  before_action :set_post, only: [:show, :vote, :edit, :update]
  before_action :require_user, except: [:index, :show]

  PER_PAGE = 10

  def index
    @page = (params[:page] || 1).to_i
    @total_pages = (Post.all.size.to_f / PER_PAGE).ceil
    set_limit
    if params[:sort] == "recent"
    @posts = Post.offset((@page - 1)* PER_PAGE).limit(PER_PAGE).order(created_at: :desc).limit(PER_PAGE)
    elsif
      params[:sort] == "top"
      @posts = Post.offset((@page - 1)* PER_PAGE).limit(PER_PAGE).sort { |a, b| b.vote_points <=> a.vote_points  }
    elsif 
      params[:sort] == "hot"
      @posts = Post.offset((@page - 1)* PER_PAGE).limit(PER_PAGE).order(created_at: :desc).sort { |a, b| b.vote_points <=> a.vote_points  }
    else
      @posts = Post.offset((@page - 1)* PER_PAGE).limit(PER_PAGE).order(created_at: :desc).sort { |a, b| b.vote_points <=> a.vote_points  }
    end
  end

  def search  
    if params[:search].blank?  
      flash[:notice] = "Please enter something..."
      redirect_to root_path
    else  
      @parameter = params[:search].downcase 
      @results = Post.all.where("lower(title) LIKE ?", "%" + @parameter + "%")  
    end  
  end

  
  def show
    @post = Post.find(params[:id])
    if  params[:sort_param] == 'new'
      @comments = @post.comments.sort{|a,b| b.created_at <=> a.created_at}
      else
      params[:sort_param] == 'top'
      @comments = @post.comments.sort { |a, b| b.vote_points <=> a.vote_points  }
      end
    render :show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
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
    respond_to do |format|
      format.html do
        if vote
          vote.update(vote: params[:vote])
          flash[:notice] = "Voted!"
        else
          Vote.create(voteable: @post, user_id: current_user.id, vote: params[:vote])
         flash[:notice] = "Thanks for your new vote!"
        end
      end

      format.js do
        if vote
          vote.update(vote: params[:vote])
          flash[:notice] = "Voted!"
        else
          Vote.create(voteable: @post, user_id: current_user.id, vote: params[:vote])
         flash[:notice] = "Thanks for your new vote!"
        end
      end
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

  def set_limit
    if @page <= 1
      @page = 1
    elsif
      @page >= @total_pages
      @page = @total_pages
    else
      @page = params[:page].to_i
    end
  end

end
