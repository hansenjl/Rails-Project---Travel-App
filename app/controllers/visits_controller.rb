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
    if params[:visit][:city_name]
      #user entered city takes precedence
      if params[:visit][:country]
        #user entered new country takes precedence
      else
        #country is chosen from drop down list
        # in this case, a new city must be created, a new country must be created, and then the visit can be created
      end

    else
      #city is selected from drop down list
      Visit.new(city_id: params[:visit][:city_id], user_id: current_user.id, rating: params[:visit][:rating])
    end


    binding.pry

  end

  private

  def visit_params
    params.require(:visit).permit(:rating, :city_attribute, :user_id)
  end
end
