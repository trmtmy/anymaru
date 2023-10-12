class CommentsController < ApplicationController
# create動作を行う前にユーザーがログインしているかどうかを判断し、ログインしていない場合はcreateが動作しない
before_action :authenticate_customer!, only: [:create]

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.customer_id = current_customer.id
    @comment.post_id = @post.id
    @comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @post = Post.find(params[:post_id])
  end

private

def comment_params
   params.require(:comment).permit(:comment)
end
end
