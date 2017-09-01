class CitiesController < ApplicationController

  def show
    @city = City.find_by(id: params[:id])
  end

  def new
    @city = City.new
    @countries = Country.all
  end

  def create
    @city = City.new(city_params)
    @countries = Country.all
    if @city.save
      redirect_to cities_path
    else
      render 'cities/new'
    end
  end

  def index
    @cities = City.all
  end

  private

  def city_params
    params.require(:city).permit(:name, countries:[:country, :name])
  end
end
