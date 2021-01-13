class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(comment_params)
        @comment.user_id = current_user.id
        @comment.save
        redirect_to post_path(@post)
    end

    def vote
        @comment = Comment.find(params[:id])
       vote = Vote.find_by(voteable: @comment, user_id: current_user.id)
       if vote
        vote.update(vote: params[:vote])
       else
        vote = Vote.create(voteable: @comment, user_id: current_user.id, vote: params[:vote])
       end
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

end
