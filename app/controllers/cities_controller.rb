class CitiesController < ApplicationController
  load_and_authorize_resource
  before_action :set_city, only: [:show, :edit, :update]

  def show
  end

  def new
    @city = City.new
    @countries = Country.all
  end

  def create
    @city = City.create(city_params)
    @countries = Country.all
    if @city.save
      redirect_to cities_path
    else
      render 'cities/new'
    end
  end

  def index
    @cities = City.all.sort{|a,b|b.visits.count <=> a.visits.count}
  end

  def edit
  end

  def update
    @city.update(city_params)
    if @city.save
    redirect_to cities_path
    else
      render 'cities/edit'
    end
  end

  private

  def set_city
     @city = City.find_by(id: params[:id])
  end

  def city_params
    params.require(:city).permit(:name, country:[:id, :name])
  end
end
