class CommentsController < ApplicationController
  before_action :require_login

  # Create comment
  def create
    @user = current_user
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to @comment.post, notice: 'Comment created!'
    else
      redirect_to @comment.post, alert: 'Something is not right!'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
