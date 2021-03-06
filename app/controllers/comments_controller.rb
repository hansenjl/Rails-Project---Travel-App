class CommentsController < ApplicationController
protect_from_forgery

  def create
    @comment = Comment.create(comments_params)
    render json: @comment, status: 201
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render json: @comment
  end

  def index
    @comments = Comment.includes(:user).includes(:city).all
    render json: @comments
  end


  private

  def comments_params
    params.require(:comment).permit(:text, :user_id, :city_id)
  end

end