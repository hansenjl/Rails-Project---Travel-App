require 'pry'
class SessionsController < ApplicationController

  def new
  end

  def fbcreate
    binding.pry
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.username = auth['info']['email']
    end

    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])

    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session.delete :user_id
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end