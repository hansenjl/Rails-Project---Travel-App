require 'pry'
class VisitsController < ApplicationController

  def new
    @visit = Visit.new
    @cities = City.all
    @countries = Country.all
    @user = User.find_by(id: params[:user_id])
  end

  def create
    binding.pry
    visit = Visit.new(visit_params)
    if visit.save
      redirect_to user_visits_path(user_id: params[:user_id])
    else
      redirect_to new_user_visit(user_id: params[:user_id])
    end
  end

  private

  def visit_params
    params.require(:visit).permit(:rating, :city_attribute, :user_id)
  end
end
