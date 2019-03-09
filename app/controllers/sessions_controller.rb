class SessionsController < ApplicationController
  def new
  end

  def fbcreate
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.username = auth['info']['email']
      u.password = 'password'
      u.password_confirmation = 'password'
    end
    @user.save
    session[:user_id] = @user.id

    redirect_to user_path(@user)
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = 'Log in failed. Please try again.'
      render 'sessions/new'
    end
  end

  def welcome
    @users = User.active_users.includes(:cities)
    @most_visited_city = City.most_visited
    @most_popular_city = City.most_popular
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