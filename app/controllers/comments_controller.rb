class CommentsController < ApplicationController
  before_action :authorize

  def create
    comment = Comment.new(comment_params)
    comment.user_id = session[:user_id]

    if comment.save
      redirect_to :photos
    else
      redirect_to "/"
    end
  end

  private
    
    def comment_params
      params.require(:comment).permit(:body)
    end
end
