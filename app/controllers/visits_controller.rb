class VisitsController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :visit, through: :user
  before_action :set_user, only: [:new, :index, :create, :destroy]

 #need to rework visits so that it is NOT nested under user but nested under city
  def new
    @visit = Visit.new
  end

  def create
    @visit = Visit.new(visit_params)
    if @visit.save
      @visit.city.set_avg_rating
      redirect_to user_visits_path(@user)
    else
      flash[:notice] = 'Visit was not saved. You cannot record the same visit twice and each visit must include a city, country, and rating.'
      redirect_to new_user_visit_url
    end
  end


  def index
    @visits = @user.visits.all
  end

  def destroy
    Visit.find_by(id: params[:id]).destroy
    redirect_to user_visits_path
  end

  private

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  def visit_params
    params.require(:visit).permit(:user_id, :city_id, :city_rating, :avatar, city_attributes:[:name,:country_id,:country])
  end
end
