class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comments_params)
    render json: @comment, status: 201
  end


  private

  def comments_params
    params.require(:comment).permit(:text, :user_id, :city_id)
  end

end