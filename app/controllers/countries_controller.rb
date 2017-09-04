class CountriesController < ApplicationController
  load_and_authorize_resource
  before_action :set_country, only: [:show, :edit, :update]

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to countries_path
    else
      render "countries/new"
    end
  end

  def edit
  end

  def update
     @country.update(country_params)
     if @country.save
       redirect_to countries_path
    else
      render "countries/edit"
    end
  end

  def show
  end

  def index
    @countries = Country.all
  end

  def destroy
    Country.find(params[:id]).destroy
    redirect_to countries_path
  end

  def most_visited
    @country = Country.most_visited
  end

  private

  def country_params
    params.require(:country).permit(:name)
  end

  def set_country
    @country = Country.find_by(id: params[:id])
  end
end
