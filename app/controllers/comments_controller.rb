class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_path(@post), notice: "Comment was successfully created."
    else
      redirect_to post_path(@post), alert: "Comment could not be created."
    end
  end

  def reply
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @reply = @comment.subordinates.build(comment_params)
    @reply.user_id = current_user.id
    @reply.post_id = @post.id
    if @reply.save!
      redirect_to post_path(@post), notice: "Reply was successfully created."
    else
      redirect_to post_path(@post), alert: "Reply could not be created."
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
