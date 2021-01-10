class CommentsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :vote]

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(comment_params)
        @comment.user_id = current_user.id
        @comment.save
        redirect_to post_path(@post)
    end

    def vote
        @comment = Comment.find(params[:id])
        vote = Vote.create(post_id: @comment, user_id: current_user.id, vote: params[:vote])
        #do later
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
      end
    private

    def comment_params
        params.require(:comment).permit(:user, :body, :user_id)
    end

    def set_post
        @post = Post.find(params[:id])
    end
end
