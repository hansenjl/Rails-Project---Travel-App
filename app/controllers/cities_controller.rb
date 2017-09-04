require 'pry'
class CitiesController < ApplicationController
  load_and_authorize_resource

  def show
    @city = City.find_by(id: params[:id])
  end

  def new
    @city = City.new
    @countries = Country.all
  end

  def create
    City.create(city_params)
    @countries = Country.all
    @city = City.find_by(:name => params[:city][:name])
    binding.pry
    if @city.persisted?
      redirect_to cities_path
    else
      render 'cities/new'
    end
  end

  def index
    @cities = City.all.sort{|a,b|b.visits.count <=> a.visits.count}
  end

  def edit
    @city = City.find_by(id: params[:id])
  end

  def update
    @city = City.find_by(id: params[:id])
    @city.update(city_params)
    if @city.save
    redirect_to cities_path
    else
      render 'cities/edit'
    end
  end

  private

  def city_params
    params.require(:city).permit(:name, country:[:id, :name])
  end
end
