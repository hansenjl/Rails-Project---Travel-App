class VisitsController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :visit, through: :user

  def new
    @visit = Visit.new
    @cities = City.all
    @countries = Country.all
    @user = User.find_by(id: params[:user_id])
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @visit = Visit.new(visit_params)
    @visit.user_id = params[:user_id]
    @visit.set_city(params[:visit][:city_attributes], @visit, @user)
    if @visit.save
      redirect_to user_visits_path(user_id: params[:user_id])
    else
      flash[:notice] = 'Visit was not saved. You cannot record the same visit twice and each visit must include a city, country, and rating.'
      redirect_to new_user_visit_url
    end
  end

  def index
    @user = User.find_by(id: params[:user_id])
    @visits = @user.visits.all
  end

  def destroy
    Visit.find(params[:id]).destroy
    redirect_to user_visits_path
  end

  private

  def visit_params
    params.require(:visit).permit(:city_rating, :city_attributes)
  end
end
