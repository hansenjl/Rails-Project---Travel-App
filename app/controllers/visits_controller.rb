class VisitsController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :visit, through: :user
  before_action :set_user, only: [:new, :index, :create, :destroy]

  def new
    @visit = Visit.new
    @cities = City.all
    @countries = Country.all
  end

  def create
    @visit = Visit.new(visit_params)
    binding.pry
    @visit.set_city(params[:visit][:city_attributes], @visit, @user)
    if @visit.save
      redirect_to user_visits_path(user_id: @user.id)
      #potentially could change to just @user
    else
      flash[:notice] = 'Visit was not saved. You cannot record the same visit twice and each visit must include a city, country, and rating.'
      redirect_to new_user_visit_url
    end
  end

  def index
    @visits = @user.visits.all
  end

  def destroy
    Visit.find(params[:id]).destroy
    redirect_to user_visits_path
  end

  private

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  def visit_params
    params.require(:visit).permit(:user_id, :city_id, :city_rating, :city_attributes)
  end
end
