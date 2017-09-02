class SessionsController < ApplicationController
  load_and_authorize_resource

  def new
  end

  def fbcreate
    @user = User.find_or_create_by(id: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.username = auth['info']['email']
      u.password = auth['credentials']['token']
    end
    session[:user_id] = @user.id
    @user.save
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
    @current_user = nil
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end