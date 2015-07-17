class CommentsController < ApplicationController


  def create
    @comment = Comment.new(comment_params)
    @comment.save
    @user_name = "#{@comment.user.first_name} #{@comment.user.last_name}"
    render json: {comment: @comment.body, user: @user_name}
  end

  private

  def comment_params
    params.permit(:body, :commentable_type, :commentable_id, :user_id)
  end
end
